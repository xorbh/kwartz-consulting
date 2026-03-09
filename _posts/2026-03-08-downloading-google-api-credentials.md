---
layout: post
title: "Downloading Google API Credentials"
date: 2026-03-08
categories: setup guides
---

Our custom connectors (Gmail, Google Drive, etc.) need a `credentials.json` file to communicate with Google's APIs. This guide walks you through downloading it from the Google Cloud Console.

The process takes about 5 minutes — but the steps depend on whether you're using a personal Gmail account or a company Google Workspace account.

---

## Personal Gmail vs Company Google Workspace

Before you start, it's important to understand the difference:

**Personal Gmail** (e.g., `you@gmail.com`): You have full control over your own Google account. You can access the Google Cloud Console directly and download the credentials file yourself by following the steps below.

**Company Google Workspace** (e.g., `you@yourcompany.com`): Your organisation's IT department manages Google Cloud access. In most cases, you won't have permission to access the Google Cloud Console or create OAuth credentials yourself. Instead:

1. **Ask your IT administrator** to access the Google Cloud Console and download the `credentials.json` file for you
2. Share this guide with them so they know exactly what's needed
3. Once they provide you with the file, skip ahead to [Step 7: Rename the File](#7-rename-the-file)

If you're unsure whether you have access, try opening the Google Cloud Console (Step 1 below). If you see a permissions error or an empty project list, you'll need to go through your IT team.

---

## Step-by-Step

### 1. Open the Google Cloud Console

Go to:

**[https://console.cloud.google.com](https://console.cloud.google.com)**

Sign in with the Google account you want to use with the connector.

### 2. Select or Create Your Project

You need a Google Cloud project to hold your credentials. Your Kwartz contact may have already set one up for you.

- Click the **project dropdown** at the top-left (next to the Google Cloud logo)
- Look for a project called **Kwartz Claude Connectors** — if it exists, select it and skip to Step 3
- If no project exists yet, click **New Project** and use the following:
  - **Project name**: `Kwartz Claude Connectors`
  - **Organisation**: Leave as default (or select your company if listed)
  - Click **Create**
- **Company accounts**: If your IT team manages Google Cloud, they may need to create the project for you or grant you access

### 3. Enable the Required API

Before creating credentials, you need to enable the API for the Google service you're connecting to:

1. Click the **hamburger menu** (☰) in the top-left corner
2. Click **APIs & Services** → **Library**
3. Search for the API you need:
   - For the Gmail connector: search for **Gmail API**
   - For the Google Drive connector: search for **Google Drive API**
4. Click on the API in the results
5. Click the **Enable** button (if it says "Manage" instead, the API is already enabled — you can skip this step)

If you're setting up both connectors, enable both APIs.

### 4. Configure the OAuth Consent Screen

If this is a new project, you'll need to set up the OAuth consent screen before creating credentials. If it's already configured, you can skip to Step 5.

1. In the left sidebar, click **OAuth consent screen**
2. Select **External** as the user type (or **Internal** if you're on Google Workspace and only want users within your organisation to use it), then click **Create**
3. Fill in the required fields:
   - **App name**: `Kwartz Claude Connectors`
   - **User support email**: Your email address
   - **Developer contact information**: Your email address
4. Click **Save and Continue**
5. On the **Scopes** screen, click **Add or Remove Scopes** and add the scopes for the connector(s) you're setting up:
   - For Gmail: `https://mail.google.com/`
   - For Google Drive: `https://www.googleapis.com/auth/drive`
   - If you're setting up both, add both scopes
6. Click **Update**, then **Save and Continue**
7. On the **Test users** screen, click **Add Users** and add the email address(es) that will use the connector
8. Click **Save and Continue**, then **Back to Dashboard**

### 5. Create OAuth Credentials

Now you can create the credentials file:

1. In the left sidebar, click **Credentials**
2. Click **+ Create Credentials** at the top of the page
3. Select **OAuth client ID**
4. For **Application type**, choose **Desktop app**
5. For **Name**, enter `Kwartz Claude Connectors`
6. Click **Create**

### 6. Download the Credentials File

After creating the OAuth client, a dialog will appear with your client ID and secret.

1. Click **Download JSON** (or the download icon ⬇)
2. This will download a file named something like `client_secret_xxxxx.json`

If you missed the dialog, you can always find your credentials later:

1. Go to **APIs & Services** → **Credentials**
2. Find your OAuth client under **OAuth 2.0 Client IDs**
3. Click the **download icon** (⬇) on the right side of the row

### 7. Rename the File

Rename the downloaded file to exactly:

```
credentials.json
```

The connector expects this exact filename.

### 8. Place the File

Move `credentials.json` into the connector folder you downloaded earlier:

- For the Gmail connector, place it inside the `gmail-mcp` folder
- For the Google Drive connector, place it inside the `gdrive-mcp` folder

If you're setting up both connectors, you'll need a copy of `credentials.json` in each folder.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Can't see any projects in the dropdown | Your Kwartz contact needs to share the project with your Google account — get in touch with them |
| No OAuth client listed under Credentials | You need to create one — follow Step 5 above |
| "Application type" dropdown doesn't show Desktop app | Make sure you clicked **OAuth client ID** (not API key or Service account) in the Create Credentials menu |
| OAuth consent screen says "Publishing status: Testing" | This is expected — the app works fine in testing mode for the users you added in Step 4 |
| Downloaded file has a different name | That's normal — just rename it to `credentials.json` |
| "Permission denied" or access errors | Make sure you're signed in with the correct Google account. For company accounts, your IT administrator may need to grant you access or download the file for you |
| "You don't have permission to access this resource" | This usually means your company's Google Workspace restricts access to the Cloud Console — contact your IT team |
| Not sure which project to select | Look for one called **Kwartz Claude Connectors**. If it doesn't exist, create a new one with that name |

---

## A Note on Security

The `credentials.json` file identifies the application to Google — it does not contain your personal login or password. Your personal authorisation happens separately when you run the connector's setup script and sign in through the browser.

That said, treat this file as confidential. Don't share it publicly or commit it to version control.

---

*Need help finding your credentials? [Get in touch](/kwartz-consulting/about/) — we'll walk you through it.*
