#!/bin/bash

# Script thiết lập Automaker với Docker
# Hướng dẫn: chmod +x setup-docker.sh && ./setup-docker.sh

echo "🚀 Thiết lập Automaker với Docker"
echo "=================================="
echo ""

# Kiểm tra Docker đã cài đặt chưa
if ! command -v docker &> /dev/null; then
    echo "❌ Docker chưa được cài đặt. Vui lòng cài đặt Docker Desktop từ:"
    echo "   https://www.docker.com/products/docker-desktop"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose chưa được cài đặt."
    exit 1
fi

echo "✅ Docker đã được cài đặt"
echo "   Docker version: $(docker --version)"
echo "   Docker Compose version: $(docker-compose --version)"
echo ""

# Kiểm tra file .env
if [ ! -f .env ]; then
    echo "⚠️  File .env chưa tồn tại"
    echo ""
    echo "Bạn có 2 lựa chọn để xác thực:"
    echo ""
    echo "1️⃣  Sử dụng Claude Code CLI (Khuyến nghị)"
    echo "   - Cài đặt và xác thực Claude CLI: https://code.claude.com/docs/en/quickstart"
    echo "   - Automaker sẽ tự động phát hiện credentials"
    echo ""
    echo "2️⃣  Sử dụng Anthropic API Key trực tiếp"
    echo "   - Lấy API key tại: https://console.anthropic.com/"
    echo "   - Tạo file .env với nội dung:"
    echo "     ANTHROPIC_API_KEY=sk-ant-your-api-key-here"
    echo ""
    
    read -p "Bạn đã có API key? (y/n): " has_api_key
    
    if [ "$has_api_key" = "y" ] || [ "$has_api_key" = "Y" ]; then
        read -p "Nhập Anthropic API key của bạn: " api_key
        echo "ANTHROPIC_API_KEY=$api_key" > .env
        echo "✅ Đã tạo file .env"
    else
        echo ""
        echo "⚠️  Bạn cần có API key hoặc cài đặt Claude CLI để tiếp tục."
        echo "   Tham khảo file .env.example để biết thêm chi tiết."
        exit 1
    fi
else
    echo "✅ File .env đã tồn tại"
fi

echo ""
echo "📦 Bắt đầu build và khởi chạy Docker containers..."
echo ""

# Build và khởi chạy containers
docker-compose up -d --build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Automaker đã được khởi chạy thành công!"
    echo ""
    echo "🌐 Truy cập ứng dụng tại:"
    echo "   - UI:  http://localhost:3007"
    echo "   - API: http://localhost:3008"
    echo ""
    echo "📋 Các lệnh hữu ích:"
    echo "   - Xem logs:        docker-compose logs -f"
    echo "   - Dừng containers: docker-compose down"
    echo "   - Khởi động lại:   docker-compose restart"
    echo ""
    echo "📚 Tài liệu thêm:"
    echo "   - README.md"
    echo "   - docs/docker-isolation.md"
    echo ""
else
    echo ""
    echo "❌ Có lỗi xảy ra khi khởi chạy Docker containers"
    echo "   Vui lòng kiểm tra logs với: docker-compose logs"
    exit 1
fi
