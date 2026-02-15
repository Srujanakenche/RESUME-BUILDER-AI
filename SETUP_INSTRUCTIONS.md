# 🚀 Setup Instructions for Resume Builder

## ⚠️ IMPORTANT: Before Running the Application

### 1. Configure MongoDB Connection

Open `backend/.env` and replace `<db_password>` with your actual MongoDB password:

```
MONGO_URI=mongodb+srv://srujana55599_db_user:YOUR_ACTUAL_PASSWORD@cluster1.g4xa6cf.mongodb.net/resume-builder?retryWrites=true&w=majority&appName=Cluster1
```

**Important Notes:**
- If your password contains special characters, they need to be URL-encoded:
  - `@` → `%40`
  - `#` → `%23`
  - `$` → `%24`
  - `%` → `%25`
  - `&` → `%26`

### 2. Whitelist Your IP in MongoDB Atlas

1. Go to [MongoDB Atlas](https://cloud.mongodb.com/)
2. Navigate to **Network Access** (Security section)
3. Click **"Add IP Address"**
4. Choose one:
   - **Add Current IP Address** (recommended for production)
   - **Allow Access from Anywhere** (0.0.0.0/0) - easier for development

### 3. (Optional) Add OpenAI API Key

If you want AI-powered features, add your OpenAI API key in `backend/.env`:

```
OPENAI_API_KEY=sk-your-actual-openai-api-key
```

Get your API key from: https://platform.openai.com/api-keys

---

## 📦 Installation Steps

### Backend Setup

```bash
cd backend
npm install
npm run dev
```

The backend should start on: `http://localhost:5001`

### Frontend Setup

Open a new terminal:

```bash
cd frontend
npm install
npm run dev
```

The frontend should start on: `http://localhost:3000`

---

## ✅ Verify Connection

If everything is set up correctly, you should see:

```
✓ Server: http://localhost:5001
✓ API: http://localhost:5001/api
✓ MongoDB connected
```

---

## 🐛 Troubleshooting

### "MongoDB connection failed"
- Check your password in `.env` is correct
- Verify IP is whitelisted in MongoDB Atlas
- Ensure your cluster is active in MongoDB Atlas

### "Module not found" errors
- Run `npm install` in both backend and frontend directories

### Port already in use
- Change PORT in `backend/.env` to a different number (e.g., 5002)

---

## 📁 Project Structure

```
fullstack-resume-builder/
├── backend/
│   ├── .env              ← Your environment variables (EDIT THIS!)
│   ├── .env.example      ← Template file
│   ├── server.js         ← Main entry point
│   └── ...
├── frontend/
│   └── ...
└── SETUP_INSTRUCTIONS.md ← This file
```

---

## 🔐 Security Reminder

- ✅ `.env` is already in `.gitignore` - it won't be committed to Git
- ✅ Never share your `.env` file or commit it to version control
- ✅ Use `.env.example` as a template for others
