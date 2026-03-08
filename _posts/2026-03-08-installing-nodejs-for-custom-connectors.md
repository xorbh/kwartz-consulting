---
layout: post
title: "Installing Node.js for Custom Connectors"
date: 2026-03-08
categories: setup guides
---

We're building custom connectors to give your team better integration with Google Drive, Gmail, and other services inside Claude. To run these connectors on your machine, you'll need **Node.js** installed.

This guide walks you through the installation — it only takes a few minutes.

---

## Quick Start

Already on board and just want the steps? Here you go.

### 1. Check if Node.js Is Already Installed

Open a terminal (Mac/Linux) or Command Prompt (Windows) and run:

```
node --version
```

- If you see a version number like `v20.11.0` or higher — **you're all set**. Skip to the verification step below.
- If you see `command not found` or an error — continue with step 2.

### 2. Download and Install Node.js

Go to the official Node.js website:

**[https://nodejs.org](https://nodejs.org)**

Download the **LTS (Long Term Support)** version — this is the green button on the left. LTS is the stable, recommended release.

| Platform | What to Download |
|----------|-----------------|
| **Mac** | macOS Installer (.pkg) |
| **Windows** | Windows Installer (.msi) |
| **Linux** | Follow the [package manager instructions](https://nodejs.org/en/download/package-manager) for your distribution |

Run the installer and accept the default settings. No custom configuration is needed.

**Prefer a video walkthrough?** These short tutorials cover the full installation process:

- **Windows**: [How to Install Node.js on Windows](https://www.youtube.com/watch?v=lt5D2EWZMN0)
- **Mac**: [How to Install Node.js on Mac](https://www.youtube.com/watch?v=l53HbzbSwxQ)

### 3. Verify the Installation

Close and reopen your terminal, then run:

```
node --version
```

You should see a version number (e.g., `v20.11.0`). You can also confirm that `npm` (Node's package manager) was installed alongside it:

```
npm --version
```

If both commands return version numbers, you're ready to go.

### 4. Let Us Know

Once Node.js is installed, let your Kwartz contact know and we'll get your custom connectors set up.

---

## Why We're Asking You to Install This

### The Problem with Built-In Connectors

Claude's Team plan includes connectors for Google Drive and Gmail — and they work for basic tasks. However, the current built-in connectors have limitations:

- **Google Drive**: Limited file type support and search capabilities. Large or nested folder structures aren't handled well.
- **Gmail**: Basic message retrieval works, but filtering, attachment handling, and bulk operations are restricted.

For teams that rely heavily on these services, these gaps become blockers. Tasks that should be straightforward — like searching across a shared drive or processing email attachments — often hit a wall.

### Custom Connectors Solve This

Kwartz is building custom connectors specifically for your team that go beyond what the built-in options offer. These connectors provide:

- **Full Google Drive access** — search, read, and process files across shared drives with proper permission handling
- **Complete Gmail integration** — advanced search, attachment processing, label management, and bulk operations
- **Reliable performance** — purpose-built for the specific workflows your team uses daily

These connectors run locally on your machine, which means your data stays on your device and routes directly to the service — nothing passes through an intermediary.

### What Is Node.js?

Node.js is a widely-used, open-source runtime that lets applications written in JavaScript run on your computer. It's the engine that powers our custom connectors.

A few things worth knowing:

- **It's safe and mainstream** — Node.js is used by millions of developers and companies worldwide, including Netflix, PayPal, and LinkedIn. It's maintained by the OpenJS Foundation.
- **It runs in the background** — once installed, you won't interact with it directly. The connectors use it behind the scenes.
- **It's lightweight** — the installation is small (around 50–80 MB) and has minimal impact on your system's performance.
- **It doesn't change your workflow** — you'll continue using Claude exactly as you do now. The connectors simply give Claude better access to your tools.

### What Happens Next

Once Node.js is installed on your machine:

1. We'll provide the connector package for your team
2. We'll walk you through a short setup process (a single command)
3. The connectors will be available inside Claude immediately

The whole process from Node.js installation to working connectors typically takes under 15 minutes.

---

*Questions or running into issues with the installation? [Get in touch](/kwartz-consulting/about/) — we're here to help.*
