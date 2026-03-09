---
layout: post
title: "Downloading Google API Credentials"
date: 2026-03-08
categories: setup guides
---

Our custom connectors (Gmail, Google Drive, etc.) need a `credentials.json` file to communicate with Google's APIs. This guide walks you through downloading it from the Google Cloud Console.

The process takes about 5 minutes.

---

## Step-by-Step

### 1. Open the Google Cloud Console

Go to:

**[https://console.cloud.google.com](https://console.cloud.google.com)**

Sign in with the Google account you want to use with the connector.

### 2. Select Your Project

Your Kwartz contact will have set up a Google Cloud project for you. You should see it listed in the project selector at the top of the page.

- Click the **project dropdown** at the top-left (next to the Google Cloud logo)
- Find and select the project your Kwartz contact shared with you
- If you don't see a project listed, reach out to your Kwartz contact — they'll need to share it with you first

### 3. Navigate to Credentials

1. Click the **hamburger menu** (☰) in the top-left corner
2. Scroll down and click **APIs & Services**
3. Click **Credentials** in the left sidebar

### 4. Download the Credentials File

You should see a list of OAuth 2.0 Client IDs. There will be one set up for the connector.

1. Find the OAuth client listed under **OAuth 2.0 Client IDs**
2. Click the **download icon** (⬇) on the right side of the row
3. This will download a file — it may be named something like `client_secret_xxxxx.json`

### 5. Rename the File

Rename the downloaded file to exactly:

```
credentials.json
```

The connector expects this exact filename.

### 6. Place the File

Move `credentials.json` into the connector folder you downloaded earlier. For example, if you're setting up the Gmail connector, place it inside the `gmail-mcp` folder.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Can't see any projects in the dropdown | Your Kwartz contact needs to share the project with your Google account — get in touch with them |
| No OAuth client listed under Credentials | The project may not be fully set up yet — reach out to your Kwartz contact |
| Downloaded file has a different name | That's normal — just rename it to `credentials.json` |
| "Permission denied" or access errors | Make sure you're signed in with the correct Google account |
| Not sure which project to select | Ask your Kwartz contact for the project name — it usually includes your company name |

---

## A Note on Security

The `credentials.json` file identifies the application to Google — it does not contain your personal login or password. Your personal authorisation happens separately when you run the connector's setup script and sign in through the browser.

That said, treat this file as confidential. Don't share it publicly or commit it to version control.

---

*Need help finding your credentials? [Get in touch](/kwartz-consulting/about/) — we'll walk you through it.*
