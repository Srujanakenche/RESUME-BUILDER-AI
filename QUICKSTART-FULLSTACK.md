# 🚀 Quick Start Guide - Full Stack AI Resume Builder

## ✅ What You Need

1. **Node.js 18+** - [Download](https://nodejs.org/)
2. **MongoDB** - Choose one:
   - **Local:** [Download MongoDB Community](https://www.mongodb.com/try/download/community)
   - **Cloud:** [MongoDB Atlas Free Tier](https://www.mongodb.com/cloud/atlas) (Recommended for beginners)
3. **OpenAI API Key** - [Get one here](https://platform.openai.com/api-keys) (Optional but recommended)

---

## 🎯 Quick Start (3 Methods)

### Method 1: One-Click Start (Easiest!)

**Windows:**
```bash
start-fullstack.bat
```

**Mac/Linux:**
```bash
./start-fullstack.sh
```

That's it! The script will:
- Install all dependencies
- Setup configuration files
- Start both backend and frontend
- Open your browser automatically

---

### Method 2: Step by Step (Recommended for first time)

#### Step 1: Setup MongoDB

**Option A - MongoDB Atlas (Cloud - Easiest):**
1. Go to https://www.mongodb.com/cloud/atlas
2. Create free account
3. Create a free cluster
4. Click "Connect" → "Connect your application"
5. Copy the connection string (looks like: `mongodb+srv://username:password@cluster...`)

**Option B - Local MongoDB:**
1. Install MongoDB Community Edition
2. Start MongoDB:
   ```bash
   # Windows
   mongod
   
   # Mac
   brew services start mongodb-community
   
   # Linux
   sudo systemctl start mongod
   ```

#### Step 2: Configure Backend

```bash
cd backend
cp .env.example .env
```

Edit `backend/.env`:
```env
MONGODB_URI=your_mongodb_connection_string_here
JWT_SECRET=any_random_string_here
OPENAI_API_KEY=sk-your_openai_key_here
```

#### Step 3: Install & Start Backend

```bash
npm install
npm run dev
```

You should see:
```
Server is running on http://localhost:5001
```

#### Step 4: Configure Frontend (New Terminal)

```bash
cd ..  # Back to root folder
cp .env.local.example .env.local
```

The defaults in `.env.local` work fine for local development!

#### Step 5: Install & Start Frontend

```bash
npm install
npm run dev
```

You should see:
```
Ready in 3.2s
Local: http://localhost:3000
```

#### Step 6: Open Browser

Go to: **http://localhost:3000**

You should see the beautiful landing page! 🎉

---

### Method 3: Manual Commands

If scripts don't work:

**Terminal 1 (Backend):**
```bash
cd backend
npm install
npm run dev
```

**Terminal 2 (Frontend):**
```bash
npm install
npm run dev
```

---

## 🎨 What You'll See

### Backend (http://localhost:5001)
```json
{
  "message": "AI Resume Builder Backend API 🚀",
  "version": "1.0.0",
  "status": "running"
}
```

### Frontend (http://localhost:3000)
- Beautiful landing page with warm beige colors
- "ResumeAI" logo
- "Start Building Now" button
- Templates gallery
- Features section

---

## 🔑 Getting API Keys

### MongoDB Atlas (Free)
1. https://www.mongodb.com/cloud/atlas
2. Create account → Create cluster
3. Database → Connect → Connection string
4. Replace `<password>` with your password

### OpenAI API Key
1. https://platform.openai.com/api-keys
2. Create account
3. Add payment method (pay-as-you-go, ~$0.002 per resume)
4. Create new secret key
5. Copy and save it (starts with `sk-`)

### JWT Secret
Just use any random string, like: `my_super_secret_jwt_key_123456`
Or generate one: https://randomkeygen.com/

---

## 🐛 Common Issues

### "MongoDB connection failed"

**Solution 1:** Using Atlas?
- Check connection string is correct
- Replace `<password>` in the connection string
- Whitelist your IP in MongoDB Atlas

**Solution 2:** Using local MongoDB?
- Make sure MongoDB is running: `mongod`
- Check it's on port 27017

### "Port 5001 already in use"

**Solution:**
```bash
# Find and kill process on port 5001
# Windows
netstat -ano | findstr :5001
taskkill /PID <PID> /F

# Mac/Linux
lsof -ti:5001 | xargs kill -9
```

### "OpenAI API error"

**Solution:**
- Verify API key is correct in `backend/.env`
- Check you have credits: https://platform.openai.com/usage
- API key starts with `sk-`

### "Cannot find module"

**Solution:**
```bash
# In backend folder
rm -rf node_modules package-lock.json
npm install

# In root folder
rm -rf node_modules package-lock.json
npm install
```

---

## ✨ Testing the Setup

1. **Backend Test:**
   - Go to http://localhost:5001
   - Should see API status message

2. **Frontend Test:**
   - Go to http://localhost:3000
   - Should see landing page

3. **Full Test:**
   - Click "Start Building Now"
   - Try creating a resume
   - Test the AI features

---

## 📝 Next Steps

Once everything is running:

1. **Create an account** - Click "Get Started"
2. **Build your resume** - Fill in your info
3. **Use AI features** - Click "✨ Generate with AI"
4. **Export** - Download as PDF or DOCX

---

## 💡 Tips

- **Keep both terminals open** - You need backend AND frontend running
- **MongoDB must be running** - Either local or Atlas
- **Check console for errors** - Both browser console and terminals
- **First time is slowest** - Subsequent starts are much faster

---

## 🆘 Still Having Issues?

1. **Check both terminals** - Look for error messages
2. **Verify Node.js version:** `node --version` (should be 18+)
3. **Check MongoDB connection** - Can you connect to your database?
4. **Try restarting** - Close everything and start fresh

---

## 🎊 Success Checklist

✅ MongoDB is running (local or Atlas)
✅ Backend is running on port 5001
✅ Frontend is running on port 3000
✅ Browser shows landing page
✅ You can create an account
✅ You can build a resume

**If all checkboxes are ✅, you're ready to build amazing resumes! 🚀**

---

**Happy Resume Building!** 🎉
