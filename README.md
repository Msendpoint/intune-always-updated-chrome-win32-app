# Deploy Always-Updated Google Chrome via Intune Win32 App

> Downloads and silently installs the latest Google Chrome directly from Google's official source, designed for Intune Win32 app deployment via Company Portal.

## Overview

This PowerShell script was extracted from an article on [MSEndpoint.com](https://msendpoint.com) and is part of the professional automation portfolio.

### Quick Start

```powershell
# Clone the repository
git clone https://github.com/Msendpoint/intune-always-updated-chrome-win32-app.git
cd intune-always-updated-chrome-win32-app

# One-click install & run (checks prerequisites, installs modules, launches script)
.\Install.ps1

# Or run the script directly
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\scripts\intune-always-updated-chrome-win32-app.ps1
```

## Script Usage

```powershell
.\scripts\intune-always-updated-chrome-win32-app.ps1
```

## Tech Stack

PowerShell, Microsoft Intune, Win32 App Packaging

## Requirements

- PowerShell 7.0 or later
- Microsoft Graph CLI (if applicable)
- Exchange Online Management module (if applicable)
- Appropriate administrative permissions

## About the Author

**Souhaiel Morhag** — Microsoft 365 & Intune Automation Specialist

- 🌐 **Blog**: [MSEndpoint.com](https://msendpoint.com) — Enterprise endpoint management insights
- 📚 **Academy**: [MSEndpoint Academy](https://app.msendpoint.com/academy) — Professional training & certifications
- 💼 **LinkedIn**: [Souhaiel Morhag](https://linkedin.com/in/souhaiel-morhag) — Connect for collaboration
- 🐙 **GitHub**: [@Msendpoint](https://github.com/Msendpoint)

## Source Article

This script originated from:
**[Deploy Always-Updated Google Chrome via Intune Company Portal (Win32 App)](https://msendpoint.com/article/deploy-the-latest-google-chrome-via-company-portal-with-intune)**

Published on MSEndpoint.com — Enterprise endpoint management blog

## Contributing

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'feat: add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

## License

MIT License — see [LICENSE](LICENSE) for details.

## Support

- Report issues: [GitHub Issues](https://github.com/Msendpoint/intune-always-updated-chrome-win32-app/issues)
- Questions: Comment on the original article or reach out on LinkedIn

---

*Developed with ❤️ by [MSEndpoint.com](https://msendpoint.com) — Your Microsoft 365 Endpoint Management Partner*