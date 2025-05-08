#!/bin/bash

# AWSプロファイルの設定
export AWS_DEFAULT_PROFILE=llm

# AWS SSOログイン
aws sso login

# ログイン状態の確認
aws sts get-caller-identity
echo "^^^ !check! If you see the above JSON, please run this script with 'source' command. ^^^"
