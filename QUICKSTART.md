# 🚀 Quick Start Guide

Welcome to AI Resume Builder! Follow these simple steps to get started.

## For Windows Users

1. **Extract the ZIP file** to a location of your choice
2. **Double-click `start.bat`** in the project folder
3. Wait for dependencies to install (first time only)
4. Open your browser to `http://localhost:3000`
5. Start building your resume! 🎉

## For Mac/Linux Users

1. **Extract the ZIP file** to a location of your choice
2. Open Terminal and navigate to the project folder:
   ```bash
   cd path/to/ai-resume-builder
   ```
3. **Run the start script**:
   ```bash
   ./start.sh
   ```
   Or manually:
   ```bash
   npm install
   npm run dev
   ```
4. Open your browser to `http://localhost:3000`
5. Start building your resume! 🎉

## 📋 Prerequisites

Make sure you have **Node.js 18+** installed:
- Download from: https://nodejs.org/
- Check version: `node --version`

## 🎨 What You'll See

1. **Landing Page**: Beautiful homepage with features and templates
2. **Builder**: Click "Start Building Now" to create your resume
3. **Templates**: Browse and select from professional templates
4. **Preview**: Real-time preview as you build

## 💡 Tips

- **No AI Key?** The app works perfectly without it! AI features are optional.
- **Auto-Save**: Your progress is automatically saved in your browser.
- **Mobile Friendly**: Works great on phones and tablets too!
- **Export**: Download your resume as PDF or DOCX when done.

## ⚡ Optional: AI Features

To enable AI-powered content generation:

1. Get an OpenAI API key from: https://platform.openai.com/api-keys
2. Open `.env.local` in the project folder
3. Add your key:
   ```
   OPENAI_API_KEY=sk-your-key-here
   ```
4. Restart the server

## 🐛 Having Issues?

**Port already in use?**
- Stop other applications using port 3000
- Or edit `package.json` and change the dev script to use a different port

**Can't install dependencies?**
- Make sure Node.js is installed: `node --version`
- Delete `node_modules` folder and `package-lock.json`
- Run `npm install` again

**Page won't load?**
- Check the terminal for errors
- Try clearing your browser cache
- Make sure the server is running

## 📚 Need More Help?

Check the full `README.md` file for:
- Detailed documentation
- API information
- Customization guides
- Advanced features

---

**Ready to create an amazing resume? Let's go! 🚀**
