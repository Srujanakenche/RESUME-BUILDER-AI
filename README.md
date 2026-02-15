# 🎨 AI Resume Builder - Full Stack Application

A complete, production-ready AI-powered resume builder with Next.js frontend and Node.js backend.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)

## 🌟 Features

- 🎨 Beautiful warm beige/cream UI
- 🤖 AI-powered content generation (OpenAI GPT-4)
- 🔐 User authentication (JWT)
- 💾 MongoDB database
- 📱 Fully responsive
- ⚡ Real-time preview
- 📤 Export PDF/DOCX
- 🎯 ATS-optimized

## 🚀 Quick Start (Windows)

1. **Extract the ZIP file**

2. **Install MongoDB** (if not installed)
   - Download: https://www.mongodb.com/try/download/community
   - Or use MongoDB Atlas (cloud): https://www.mongodb.com/cloud/atlas

3. **Run the startup script:**
   ```bash
   start-fullstack.bat
   ```

4. **Open your browser:**
   - Frontend: http://localhost:3000
   - Backend: http://localhost:5001

## ⚙️ Configuration

### Backend Setup

1. Navigate to `backend` folder
2. Copy `.env.example` to `.env`
3. Edit `.env`:
   ```env
   MONGODB_URI=mongodb://localhost:27017/resume-builder
   JWT_SECRET=your_secret_key_here
   OPENAI_API_KEY=sk-your-openai-key-here
   ```

### Frontend Setup

1. Copy `.env.local.example` to `.env.local` (in root folder)
2. Edit if needed (defaults work for local development)

## 📁 Project Structure

```
├── app/              # Frontend Next.js app
├── components/       # React components
├── lib/             # Utils & API client
├── backend/         # Node.js backend
│   ├── app/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   └── services/
└── start-fullstack.bat  # Windows startup script
```

## 🔌 API Endpoints

**Auth:**
- POST /api/auth/register
- POST /api/auth/login
- GET /api/auth/me

**Resumes:**
- POST /api/resume
- GET /api/resume
- PUT /api/resume/:id
- DELETE /api/resume/:id
- POST /api/resume/generate (AI)

## 💡 Manual Setup

**Backend:**
```bash
cd backend
npm install
npm run dev
```

**Frontend (new terminal):**
```bash
npm install
npm run dev
```

## 🐛 Troubleshooting

**MongoDB not connecting?**
- Ensure MongoDB is running
- Check MONGODB_URI in backend/.env

**Port already in use?**
- Backend: Change PORT in backend/.env
- Frontend: Run `npm run dev -- -p 3001`

**AI not working?**
- Add OPENAI_API_KEY to backend/.env
- Get key from: https://platform.openai.com/api-keys

## 📚 Tech Stack

- **Frontend:** Next.js 14, React, TypeScript, Tailwind
- **Backend:** Node.js, Express, MongoDB, JWT
- **AI:** OpenAI GPT-4

---

**Need help?** Check the detailed docs in the code or console logs! 🚀
