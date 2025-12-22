import { useMemo } from 'react';
import { Node, Edge } from '@xyflow/react';
import { Feature } from '@/store/app-store';
import { getBlockingDependencies } from '@automaker/dependency-resolver';

export interface TaskNodeData extends Feature {
  isBlocked: boolean;
  isRunning: boolean;
  blockingDependencies: string[];
}

export type TaskNode = Node<TaskNodeData, 'task'>;
export type DependencyEdge = Edge<{ sourceStatus: Feature['status']; targetStatus: Feature['status'] }>;

interface UseGraphNodesProps {
  features: Feature[];
  runningAutoTasks: string[];
}

/**
 * Transforms features into React Flow nodes and edges
 * Creates dependency edges based on feature.dependencies array
 */
export function useGraphNodes({ features, runningAutoTasks }: UseGraphNodesProps) {
  const { nodes, edges } = useMemo(() => {
    const nodeList: TaskNode[] = [];
    const edgeList: DependencyEdge[] = [];
    const featureMap = new Map<string, Feature>();

    // Create feature map for quick lookups
    features.forEach((f) => featureMap.set(f.id, f));

    // Create nodes
    features.forEach((feature) => {
      const isRunning = runningAutoTasks.includes(feature.id);
      const blockingDeps = getBlockingDependencies(feature, features);

      const node: TaskNode = {
        id: feature.id,
        type: 'task',
        position: { x: 0, y: 0 }, // Will be set by layout
        data: {
          ...feature,
          isBlocked: blockingDeps.length > 0,
          isRunning,
          blockingDependencies: blockingDeps,
        },
      };

      nodeList.push(node);

      // Create edges for dependencies
      if (feature.dependencies && feature.dependencies.length > 0) {
        feature.dependencies.forEach((depId: string) => {
          // Only create edge if the dependency exists in current view
          if (featureMap.has(depId)) {
            const sourceFeature = featureMap.get(depId)!;
            const edge: DependencyEdge = {
              id: `${depId}->${feature.id}`,
              source: depId,
              target: feature.id,
              type: 'dependency',
              animated: isRunning || runningAutoTasks.includes(depId),
              data: {
                sourceStatus: sourceFeature.status,
                targetStatus: feature.status,
              },
            };
            edgeList.push(edge);
          }
        });
      }
    });

    return { nodes: nodeList, edges: edgeList };
  }, [features, runningAutoTasks]);

  return { nodes, edges };
}
