#!/bin/bash

# ========================================
# Ferrari Girlfriend - 生产环境启动脚本
# ========================================

echo ""
echo "========================================"
echo "  Ferrari Girlfriend - Production Server"
echo "========================================"
echo ""
echo "Starting with environment variables..."
echo ""

# 检查是否已安装依赖
if [ ! -d "node_modules" ]; then
    echo "[1/3] 正在安装依赖..."
    pnpm install
    if [ $? -ne 0 ]; then
        echo "错误：依赖安装失败！"
        exit 1
    fi
else
    echo "[1/3] 依赖已安装，跳过..."
fi

echo ""
echo "[2/3] 正在构建生产版本..."
pnpm run build
if [ $? -ne 0 ]; then
    echo ""
    echo "错误：构建失败！"
    echo "请检查错误信息并修复后重试。"
    echo ""
    exit 1
fi

echo ""
echo "[3/3] 启动生产服务器..."
echo ""
echo "========================================"
echo "  Ferrari Girlfriend - Production Server"
echo "========================================"
echo ""
echo "环境变量已加载。"
echo "正在端口 5000 上启动生产服务器..."
echo ""
echo "按 Ctrl+C 停止服务器"
echo ""
pnpm run start
