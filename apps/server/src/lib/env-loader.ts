/**
 * Environment Loader
 *
 * Centralizes dotenv loading to ensure environment variables are available
 * before any other module initialization. This module should be imported
 * first in entry points (index.ts, auth.ts, provider-factory.ts).
 *
 * Load order:
 * 1. Project root .env (apps/server/src/lib -> ../../../../.env = project root)
 * 2. Current working directory .env (fallback, won't override existing vars)
 */

import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Path: apps/server/src/lib/ -> project root (4 levels up)
const rootEnvPath = path.join(__dirname, '../../../../.env');

// Load from project root first (primary source)
dotenv.config({ path: rootEnvPath });

// Fallback: load from CWD if any vars are missing (won't override existing)
dotenv.config();
