---
layout: post
title: "Setting Up the Gmail Connector for Claude"
date: 2026-03-08
categories: setup guides
---

We've built a custom Gmail connector that gives Claude full access to your email — search, read, send, reply, manage labels, download attachments, and more. It runs locally on your machine, so your data stays private.

This guide walks you through setting it up. The whole process takes about 15 minutes.

**Prerequisites:** You'll need Node.js installed on your machine. If you haven't done that yet, follow our [Node.js installation guide](/kwartz-consulting/setup/guides/installing-nodejs-for-custom-connectors/) first.

---

## Quick Start

### 1. Download the Connector

Download the Gmail connector from GitHub:

**[https://github.com/xorbh/gmail-mcp](https://github.com/xorbh/gmail-mcp)**

Click the green **Code** button, then **Download ZIP**. Unzip it to a location you'll remember (e.g., your Documents folder).

### 2. Add Your Credentials File

We'll provide you with a `credentials.json` file — this is what connects the tool to Google's API. Place it inside the Gmail connector folder you just unzipped.

If you haven't received this file yet, reach out to your Kwartz contact.

### 3. Run the Setup Script

- **Mac**: Double-click `setup.command`. If you get a security warning, right-click the file and choose **Open** instead.
- **Windows**: Double-click `setup.bat`. If you recently installed Node.js, you may need to restart your computer first.

The setup script will:
1. Install the required dependencies
2. Build the project
3. Open a browser window for Google sign-in

### 4. Authorise with Google

When the browser opens, sign in with your Google account. You'll see a warning that says **"Google hasn't verified this app"** — this is expected and safe. Click **Advanced**, then **"Go to MCP Server (unsafe)"** to continue.

Grant the requested permissions. These allow Claude to read, send, and manage your email on your behalf.

### 5. Configure Claude Desktop

After authorisation, the setup script will display a configuration block. It looks something like this:

```json
{
  "mcpServers": {
    "gmail": {
      "command": "node",
      "args": ["/path/to/gmail-mcp/dist/index.js", "--config-dir", "/path/to/gmail-mcp/config/default"]
    }
  }
}
```

You need to add this to your Claude Desktop configuration file:

- **Mac**: Open `~/.config/Claude/claude_desktop_config.json`
- **Windows**: Open `%APPDATA%\Claude\claude_desktop_config.json`

Paste the configuration, save the file, and **restart Claude Desktop completely** (quit and reopen, don't just close the window).

### 6. Verify It's Working

Once Claude restarts, you should see a small **hammer icon** in the chat input area. This means the connector is active.

Try asking Claude something like:

> "Do I have any unread emails?"

If Claude can read your inbox, you're all set.

---

## What You Can Do With It

Once the connector is running, you can ask Claude to handle your email naturally. Here are some examples:

| What You Want | What to Ask Claude |
|--------------|-------------------|
| Check new mail | "Do I have any unread emails?" |
| Search emails | "Find emails from Sarah about the project proposal" |
| Read a message | "Read the latest email from accounts@..." |
| Send an email | "Send an email to bob@example.com about tomorrow's meeting" |
| Reply to a thread | "Reply to that email and say I'll be there" |
| Create a draft | "Draft a reply to the last message from my manager" |
| Download attachments | "Download the attachment from that email" |
| Manage labels | "Label this email as important" |
| Clean up | "Move that email to trash" |

The connector supports **full Gmail search syntax**, so Claude can search using any filter you'd normally use in Gmail — by sender, date, subject, attachments, labels, and more.

---

## Multiple Gmail Accounts

If you need Claude to access more than one Gmail account (e.g., personal and work), this is supported. The setup requires a few extra steps in the terminal — reach out to your Kwartz contact and we'll walk you through it.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Hammer icon doesn't appear in Claude | Make sure you saved the config file and fully restarted Claude Desktop |
| "Missing credentials.json" error | Make sure `credentials.json` is in the connector folder, then run the setup script again |
| "Token expired" or authentication errors | Delete the `token.json` file inside `config/default/` and run the setup script again |
| Setup script closes immediately (Mac) | Right-click the file and choose **Open** instead of double-clicking |
| Setup script fails (Windows) | Restart your computer after installing Node.js, then try again |
| "Google hasn't verified this app" warning | This is expected — click Advanced → "Go to MCP Server (unsafe)" |

---

## How It Works

For those curious about what's happening under the hood:

The Gmail connector is an **MCP server** (Model Context Protocol). MCP is an open standard that lets AI assistants like Claude connect to external tools and data sources. When you ask Claude to check your email, Claude sends a request to the connector running on your machine, which talks directly to Gmail's API and returns the results.

Everything runs locally — your emails aren't sent to any intermediary. The connector communicates directly between your machine and Google's servers.

---

## What's Next

We're also building a **Google Drive connector** with the same approach — full file search, reading, and processing across your shared drives. Stay tuned.

---

*Running into issues or need help with setup? [Get in touch](/kwartz-consulting/about/) — we're here to help.*
