# GitHub Sync Plugin

A Roblox Studio plugin for syncing Roblox projects with GitHub repositories.

---

## 🌟 Overview

The **GitHub Sync Plugin** allows Roblox developers to integrate version control into their Roblox Studio workflow by syncing game files directly with GitHub. This helps maintain project history, collaborate with teams, and safely back up game assets.

---

## 🚀 Features

- Authenticate with GitHub via personal access token.
- Serialize Roblox objects into file formats suitable for GitHub storage.
- Upload serialized files directly to a GitHub repository.
- Modular design for easy extension and maintenance.

---

## 📂 Project Structure

```bash
github-sync-plugin/
│
├── src/
│   ├── init.plugin.lua         # Entry point for the plugin
│   ├── init.server.lua         # Server-side initialization (if needed)
│   ├── Controllers/
│   │   └── SyncController.lua  # Core logic for syncing files
│   ├── Services/
│   │   ├── FileSerializer.lua  # Serialize Roblox objects to GitHub-friendly formats
│   │   ├── GitHubAPIService.lua# Handles GitHub API requests (commits, pushes, etc.)
│   │   └── TokenStorage.lua    # Securely store GitHub access tokens locally
│   └── UI/
│       └── TokenPanel.lua      # UI for entering and managing GitHub tokens
```

---

## ⚙️ Installation

1. Clone or download this repository.
2. Open **Roblox Studio**.
3. In the **Plugins** tab, load the plugin from file (`src/init.plugin.lua`).
4. Follow the UI to authenticate with GitHub.

---

## 🔐 GitHub Authentication

- Requires a GitHub personal access token (PAT).
- The token should have `repo` and `workflow` scopes for full sync functionality.
- The plugin stores the token securely via the `TokenStorage` service.

---

## 💡 Usage

1. Open Roblox Studio and launch the plugin.
2. Enter your GitHub credentials in the Token Panel.
3. Select the files or objects you wish to sync.
4. Use the plugin interface to push changes directly to your GitHub repo.

---

## 📌 TODO & Future Work

- [ ] Support two-way syncing (pulling from GitHub to Roblox Studio)
- [ ] Auto conflict resolution
- [ ] Improved error reporting for GitHub API failures
- [ ] Branch management inside plugin UI
- [ ] OAuth-based authentication flow (more secure)

---

## 🤝 Contribution

Contributions are welcome! Feel free to fork the repo, create issues, or submit pull requests.  
Please follow Roblox Studio best practices and modular design principles when contributing.

---

## 📄 License

This project is licensed under the MIT License.

---

## 🔗 Links

- [Roblox Developer Forum](https://devforum.roblox.com/)
- [GitHub REST API v3 Docs](https://docs.github.com/en/rest)