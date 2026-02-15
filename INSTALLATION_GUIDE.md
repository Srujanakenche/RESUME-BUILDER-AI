# 📥 Installation Guide - Resume Builder

## ✅ What's New in This Version

All export features are now **FULLY FUNCTIONAL**:
- ✅ **Download as PDF** - Working with high-quality export
- ✅ **Download as DOCX** - Creates properly formatted Word documents
- ✅ **Print** - Browser print functionality
- ✅ **Share Link** - Copy link or native share on mobile

---

## 🚀 Quick Start (3 Steps)

### Step 1: Extract & Navigate

```bash
# Extract the zip file
# Then open terminal/command prompt and navigate to the project
cd fullstack-resume-builder
```

### Step 2: Install Dependencies

**Backend:**
```bash
cd backend
npm install
```

**Frontend (in a new terminal):**
```bash
cd frontend
npm install
```

> **Note:** The first `npm install` might take 2-3 minutes. This is normal!

### Step 3: Configure Environment

1. Open `backend/.env` in any text editor
2. Replace `<db_password>` with your MongoDB password
3. Save the file

**Your .env should look like:**
```
MONGO_URI=mongodb+srv://srujana55599_db_user:YOUR_ACTUAL_PASSWORD@cluster1...
```

---

## 🎯 Running the Application

**Start Backend:**
```bash
cd backend
npm run dev
```

You should see:
```
✓ Server running on http://localhost:5001
✓ MongoDB connected
```

**Start Frontend (new terminal):**
```bash
cd frontend
npm run dev
```

You should see:
```
✓ Ready on http://localhost:3000
```

**Open in Browser:**
- Go to `http://localhost:3000`

---

## 🔧 MongoDB Setup (If Not Done Already)

### Option 1: Whitelist Your IP (Quick)

1. Go to https://cloud.mongodb.com/
2. Click **Network Access** (left sidebar)
3. Click **Add IP Address**
4. Select **Allow Access from Anywhere (0.0.0.0/0)**
5. Click **Confirm**

### Option 2: Check Your Password

If connection still fails, verify your password in MongoDB Atlas:
1. Go to **Database Access**
2. Edit your user `srujana55599_db_user`
3. Click **Edit Password**
4. Copy the new password
5. Update it in `backend/.env`

---

## 📦 New Dependencies Added

These packages enable the export features:

**Frontend:**
- `docx` - Creates Word documents
- `file-saver` - Saves files to user's device
- `jspdf` - Generates PDF files (already included)
- `html2canvas` - Captures resume as image (already included)

All these will be automatically installed when you run `npm install`!

---

## 🎨 Export Features Explained

### Download as PDF
- Captures the resume preview as a high-quality image
- Converts to PDF format
- Downloads with filename: `FirstName_LastName_Resume.pdf`

### Download as DOCX
- Creates a professionally formatted Word document
- Maintains all formatting and structure
- Fully editable in Microsoft Word, Google Docs, etc.
- Downloads with filename: `FirstName_LastName_Resume.docx`

### Print
- Opens browser print dialog
- Ready for direct printing or Save as PDF

### Share Link
- On mobile: Opens native share dialog
- On desktop: Copies link to clipboard
- Easy sharing via email, messaging, etc.

---

## 🐛 Troubleshooting

### "Module not found" errors

**Solution:**
```bash
# In frontend directory
npm install

# If that doesn't work, try:
rm -rf node_modules package-lock.json
npm install
```

### PDF export is blank

**Solution:**
- Wait for the resume preview to fully load before clicking export
- Make sure you've filled in the form fields

### DOCX export not working

**Solution:**
- Check browser console for errors
- Try in a different browser (Chrome/Edge recommended)
- Ensure `npm install` completed successfully

### MongoDB connection fails

**Solution:**
1. Check password in `.env` has NO angle brackets: `<` or `>`
2. Verify IP is whitelisted in MongoDB Atlas
3. Check internet connection

---

## 📱 Browser Compatibility

**Recommended:**
- ✅ Chrome/Edge (v90+)
- ✅ Firefox (v88+)
- ✅ Safari (v14+)

**Export Features:**
- PDF: Works in all modern browsers
- DOCX: Works in all modern browsers
- Print: Works in all browsers
- Share: Native share only on mobile (copies link on desktop)

---

## 💡 Pro Tips

1. **Better PDF Quality:** Zoom the preview to 100% before exporting
2. **Custom Templates:** Edit the preview component colors/fonts in `components/ResumePreview.tsx`
3. **Save Progress:** The app saves your data automatically when connected to backend
4. **Multiple Formats:** You can export both PDF and DOCX - each has its advantages!

---

## 📝 Notes

- Your `.env` file is protected by `.gitignore` - it won't be committed to Git
- All exports happen client-side - your data stays private
- No external services are used for PDF/DOCX generation

---

## 🆘 Still Having Issues?

Check these files:
- `SETUP_INSTRUCTIONS.md` - Detailed setup guide
- `QUICK_START_GUIDE.md` - Super quick reference
- `backend/README.md` - Backend-specific info

Or check the browser console (F12) for error messages!
