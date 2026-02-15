# 🪟 Windows Quick Start Guide

## ✅ Prerequisites

You need **Node.js** installed. Check if you have it:

1. Open Command Prompt (cmd) or PowerShell
2. Type: `node --version`
3. If you see a version number (like v18.x.x), you're good!
4. If not, download from: https://nodejs.org/ (get the LTS version)

## 🚀 Method 1: Using start.bat (Recommended)

1. **Extract the ZIP file** to a folder like:
   - `C:\Users\YourName\Desktop\ai-resume-builder`
   - Or anywhere you prefer

2. **Open the folder** in File Explorer

3. **Double-click `start.bat`**
   - A black window (terminal) will open
   - First time: It will install dependencies (takes 2-3 minutes)
   - Then it will start the server
   - Keep this window open!

4. **Open your browser** to:
   ```
   http://localhost:3000
   ```

5. **You should see** the beautiful landing page with warm beige colors!

## 🚀 Method 2: Using run.bat (Simpler)

If `start.bat` doesn't work, try:

1. Double-click `run.bat`
2. Wait for installation
3. Open browser to `http://localhost:3000`

## 🚀 Method 3: Manual (Most Reliable)

If batch files don't work, do this manually:

1. **Open PowerShell or Command Prompt**
   - Press `Win + R`
   - Type `cmd` and press Enter

2. **Navigate to the project folder**
   ```cmd
   cd C:\Users\YourName\Desktop\ai-resume-builder
   ```
   (Replace with your actual path)

3. **Install dependencies** (first time only)
   ```cmd
   npm install
   ```
   Wait for it to finish (2-3 minutes)

4. **Start the server**
   ```cmd
   npm run dev
   ```

5. **Open browser** to `http://localhost:3000`

## 🐛 Troubleshooting

### Problem: "node is not recognized"
**Solution:** Node.js is not installed or not in PATH
- Install Node.js from https://nodejs.org/
- Restart your computer after installing
- Try again

### Problem: "start.bat is not recognized"
**Solution:** Windows PowerShell has different commands
- Use `run.bat` instead
- Or use Method 3 (Manual)

### Problem: "Cannot find module"
**Solution:** Dependencies not installed
```cmd
npm install
```

### Problem: "Port 3000 is already in use"
**Solution:** Another app is using that port
- Close other applications
- Or use a different port:
```cmd
npm run dev -- -p 3001
```
Then open: `http://localhost:3001`

### Problem: Files not loading / blank page
**Solution:** Wait a minute, then refresh
- The first build takes time
- Check the terminal for errors
- Clear browser cache (Ctrl + Shift + Delete)

## ✅ How to Know It's Working

When successful, you should see:

**In the terminal:**
```
✓ Ready in 3.2s
○ Local: http://localhost:3000
```

**In the browser:**
- Beautiful landing page with warm beige/cream colors
- Navigation bar at the top with "ResumeAI" logo
- Big heading "Craft Your Perfect Resume"
- "Start Building Now" button
- Features section
- Templates gallery

## 🎉 Next Steps

Once it's running:

1. Click "Start Building Now"
2. Fill in your information
3. See real-time preview on the right
4. Choose a template
5. Download your resume!

## 💡 Tips

- **Keep the terminal open** while using the app
- **Don't close the black window** - that's your server
- **Bookmark** http://localhost:3000 for easy access
- **Your data auto-saves** in the browser
- **No internet needed** after installation (except AI features)

## 🆘 Still Having Issues?

Try these in order:

1. **Restart your computer** (seriously, this often helps!)

2. **Delete and reinstall:**
   ```cmd
   rmdir /s /q node_modules
   del package-lock.json
   npm install
   ```

3. **Check if Node.js is really installed:**
   ```cmd
   node --version
   npm --version
   ```
   Both should show version numbers

4. **Try running as Administrator:**
   - Right-click `start.bat`
   - Select "Run as administrator"

5. **Use Visual Studio Code:**
   - Open the folder in VS Code
   - Open terminal (Ctrl + `)
   - Run: `npm install` then `npm run dev`

## 📝 Important Notes

- **First run takes longest** (2-3 minutes to install)
- **Subsequent runs are fast** (5-10 seconds)
- **AI features are optional** - app works without them
- **Your data stays local** - nothing sent to servers (unless you use AI)

---

## 🎊 Success!

If you see the landing page, **you're all set!** 

Start building your resume and enjoy the beautiful new interface! 🚀

**Having problems?** Check the main README.md for more detailed troubleshooting.
