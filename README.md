# Amazon Q Developer CLI サンプルリポジトリ

このリポジトリは、Amazon Q Developer CLI と Model Context Protocol (MCP) を試すためのサンプルプロジェクトです。

## 概要

このリポジトリにはテスト用の MCP サーバ として、以下のリポジトリをクローンしたデータを含んでいます：

- **mcp-jr-east-delay**: JR東日本の列車遅延情報を取得するためのModel Context Protocol (MCP) サーバー [GitHub: tinjyuu/mcp-jr-east-delay](https://github.com/tinjyuu/mcp-jr-east-delay/tree/main)

2025/5/8 時点のコードのため、最新のコードを利用するには、必ず git clone してください。

## mcp-jr-east-delay 

JR東日本の列車遅延情報を取得するMCPサーバーを実装しています。Amazon Q Developer CLI などの MCP クライアントから「getDelays」ツールを呼び出すことで、JR東日本の遅延情報を取得できます。

### 主な機能

- JR東日本の列車遅延情報の取得
- MCPプロトコルに準拠したサーバー実装
- Amazon Q Developerとの連携

### セットアップと使用方法

詳細な設定と使用方法については、[mcp-jr-east-delayのREADME](./mcp-jr-east-delay/README.md)を参照してください。

ただし、 Description の追記が必要な箇所があるため、元のリポジトリのコードを良く確認して利用してください。（2025/5/8時点のコードは修正したコードを入れています。） 

```JavaScript
--- index.ts.orig       2025-05-08 16:12:45
+++ index.ts    2025-04-30 16:09:26
@@ -68,6 +68,7 @@
   // Tool: getDelays
   server.tool(
     "getDelays",
+    "Gets train delay information for JR East railway lines in the specified area",
     {
       area: z.enum(["kanto", "tohoku", "shinetsu", "shinkansen"]).optional(),
     },
@@ -109,3 +110,4 @@
 }
 
 await main(); 
+
```

## 環境構築

- Devcontainer で環境構築することができます。（Node.js, npm, Python, AWS CLI）
- Amazon Q Developer CLI (インストール方法は[公式ドキュメント](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/setup-dev-cli.html)を参照)
- Amazon Q Developer CLI は Mac の環境を想定してインストールされます。コンテナをビルドするときに Builders ID での認証が必要になりますので、ターミナルの表示に従って操作してください。

## 利用方法

利用したい MCP サーバ は `.amazonq/mcp.json` または `~/.aws/amazonq/mcp.json` に記載します。

Amazon Q Developer CLI は以下のコマンドで起動できます。

```bash
q chat
```

## ライセンス

このプロジェクトは、リポジトリ内の個別のライセンスファイルに従います。 
