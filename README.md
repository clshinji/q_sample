# Amazon Q Developer CLI サンプルリポジトリ

このリポジトリは、Amazon Q Developer CLI と Model Context Protocol (MCP) を試すためのサンプルプロジェクトです。

## 概要

このリポジトリは Amazon Q Developer CLI を使って、 MCP を利用するサンプルです。


## mcp-jr-east-delay 

JR東日本の列車遅延情報を取得するMCPサーバーを構築できます。

- **mcp-jr-east-delay**: JR東日本の列車遅延情報を取得するためのModel Context Protocol (MCP) サーバー [GitHub: tinjyuu/mcp-jr-east-delay](https://github.com/tinjyuu/mcp-jr-east-delay/tree/main)

```bash
git clone https://github.com/tinjyuu/mcp-jr-east-delay.git
```

### 主な機能

- JR東日本の列車遅延情報の取得
- MCPプロトコルに準拠したサーバー実装
- Amazon Q Developerとの連携

### セットアップと使用方法

詳細な設定と使用方法については、[mcp-jr-east-delayのREADME](https://github.com/tinjyuu/mcp-jr-east-delay/blob/main/README.md)を参照してください。

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

### WSL での環境構築

Ubuntu のコマンドライン用に Amazon Q をダウンロードします。

```
wget https://desktop-release.q.us-east-1.amazonaws.com/latest/amazon-q.deb
```

パッケージをインストールします。

```
sudo apt-get install -f
sudo dpkg -i amazon-q.deb
```

Amazon Q にログインします。

```
q login
```

Builder ID または IAM アイデンティティセンターで、アカウント管理者から提供された開始 URL を使用して認証を行います。

## 利用方法

利用したい MCP サーバ は `.amazonq/mcp.json` または `~/.aws/amazonq/mcp.json` に記載します。
記載例は以下を参考にどうぞ。

```json
{
  "mcpServers": {
    "jr-east-delay": {
      "command": "node",
      "args": ["こんな感じのフルパスを入力/mcp-jr-east-delay/build/index.js"],
      "description": "JR東日本の遅延情報を取得するMCPサーバー"
    }
  }
}
```

MCP サーバーを 別のターミナルで 起動しておきます。

```bash
# mcp-jr-east-delay ディレクトリで実行する場合
# ターミナルには何も出力されませんが、正常動作です
node build/index.js
```

Amazon Q Developer CLI は以下のコマンドで起動できます。

```bash
q chat
```

うまく起動した場合のサンプルです。 Amazon Q は AI エージェントになっているので、途中で MCP サーバーに問い合わせて良いか確認されています。（ここでは y と入力して許可している。）

```bash
k-nagayama@LAPTOP-AC8RCM05:/mnt/c/code/q_sample$ q chat
To learn more about MCP safety, see https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line-mcp-security.html
✓ jr_east_delay loaded in 8.64 s
✓ 1 of 1 mcp servers initialized

Welcome to 

 █████╗ ███╗   ███╗ █████╗ ███████╗ ██████╗ ███╗   ██╗     ██████╗ 
██╔══██╗████╗ ████║██╔══██╗╚══███╔╝██╔═══██╗████╗  ██║    ██╔═══██╗
███████║██╔████╔██║███████║  ███╔╝ ██║   ██║██╔██╗ ██║    ██║   ██║
██╔══██║██║╚██╔╝██║██╔══██║ ███╔╝  ██║   ██║██║╚██╗██║    ██║▄▄ ██║
██║  ██║██║ ╚═╝ ██║██║  ██║███████╗╚██████╔╝██║ ╚████║    ╚██████╔╝
╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝     ╚══▀▀═╝ 
                                                        


╭───────────────────────── Did you know? ─────────────────────────╮
│                                                                 │
│      You can execute bash commands by typing ! followed by      │
│                           the command                           │
│                                                                 │
╰─────────────────────────────────────────────────────────────────╯


/help all commands  •  ctrl + j new lines  •  ctrl + k fuzzy search
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>  新宿から東京まで行きたいんだけど、JRの運行状況ってどうかな？

JR東日本の運行状況を確認してみますね。関東エリアの遅延情報を取得します。


🛠️  Using tool: getDelays from mcp server jr_east_delay
 ⋮ 
 ● Running getDelays with the param:
 ⋮  {
 ⋮    "arguments": {
 ⋮      "area": "kanto"
 ⋮    },
 ⋮    "name": "getDelays"
 ⋮  }
Allow this action? Use 't' to trust (always allow) this tool for the session. [y/n/t]:

> y

 ⋮ 
 ● Completed in 0.520s


現在のJR東日本の関東エリアの運行状況を確認しました。新宿から東京間の山手線や中央線などについては特に遅延や運転見合わせの情報はありません。
以下の路線で遅延や運休の情報があります：

1. 上越線：越後堀之内～小出駅間での沿線火災の影響で、長岡～小出駅間の運転を見合わせていましたが、13時28分頃に運転を再開しました。長岡～越後
湯沢駅間の一部列車に遅れが出ています。

2. 内房線：保守工事のため、5月13日(火)、14日(水)、15日(木)の各日10時30分から14時40分頃まで、館山～安房鴨川駅間の上下線で一部列車が運休しま
す。

新宿から東京までの区間については現在特に問題はないようですので、通常通り電車を利用できると思います。

> /quit
k-nagayama@LAPTOP-AC8RCM05:/mnt/c/code/q_sample$ 
```
