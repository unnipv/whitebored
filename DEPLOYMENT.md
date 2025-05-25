# 🚀 Deployment Guide - Digital Whiteboard

This guide covers the best options for hosting your digital whiteboard 24/7 with public internet access.

## 🌟 **Recommended: Railway (Free Tier)**

**Best overall option** - 500 hours/month free (enough for 24/7), easy deployment, reliable.

### Quick Deploy to Railway:

1. **Sign up** at [railway.app](https://railway.app) with GitHub
2. **Connect your repository** or upload your code
3. **Deploy automatically** - Railway detects Node.js and deploys
4. **Get your URL** - `https://your-app-name.railway.app`

### Manual Railway Setup:

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login and deploy
railway login
railway init
railway up
```

**Free Tier Limits:**
- ✅ 500 execution hours/month (20+ days)
- ✅ 1GB RAM, 1 vCPU
- ✅ Custom domains
- ✅ Automatic HTTPS
- ✅ No credit card required

---

## 🔄 **Alternative Options**

### 1. **Render (Free Tier)**
- ✅ Always-on free tier
- ❌ Spins down after 15 minutes of inactivity
- ❌ 750 hours/month limit

```bash
# Deploy to Render
1. Connect GitHub repo at render.com
2. Choose "Web Service"
3. Build: npm install
4. Start: npm start
```

### 2. **Heroku (Paid - $7/month)**
- ✅ Very reliable
- ✅ Easy deployment
- ❌ No free tier anymore

```bash
# Deploy to Heroku
heroku create your-whiteboard-app
git push heroku main
```

### 3. **Fly.io (Free Tier)**
- ✅ 3 shared-cpu-1x VMs free
- ✅ 160GB/month bandwidth
- ✅ Good performance

```bash
# Deploy to Fly.io
npm install -g @fly.io/flyctl
fly auth signup
fly launch
fly deploy
```

### 4. **Vercel (Free Tier)**
- ✅ Excellent for static sites
- ❌ Serverless functions have 10-second timeout
- ❌ Not ideal for persistent WebSocket connections

### 5. **Netlify (Free Tier)**
- ❌ Static hosting only, no Node.js backend

---

## 🏠 **Self-Hosting Options**

### 1. **Raspberry Pi at Home**
**Most cost-effective long-term solution**

```bash
# On Raspberry Pi
sudo apt update
sudo apt install nodejs npm
git clone your-repo
cd digital-whiteboard
npm install
npm start

# Auto-start on boot
sudo nano /etc/systemd/system/whiteboard.service
```

**Pros:** One-time cost (~$50), full control, no monthly fees
**Cons:** Need static IP or dynamic DNS, power/internet dependent

### 2. **Home Server + Cloudflare Tunnel**
**Free public access without port forwarding**

```bash
# Install Cloudflare Tunnel
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
sudo dpkg -i cloudflared.deb

# Create tunnel
cloudflared tunnel create whiteboard
cloudflared tunnel route dns whiteboard whiteboard.yourdomain.com
cloudflared tunnel run whiteboard
```

### 3. **VPS (Virtual Private Server)**
**$5-10/month options:**
- DigitalOcean Droplet ($6/month)
- Linode Nanode ($5/month)
- Vultr ($6/month)

---

## 📱 **Setup for Your Use Case**

### For Your Samsung Tab E:
1. **Bookmark the display URL:** `https://your-app.railway.app/display`
2. **Enable full-screen mode** in browser settings
3. **Disable screen timeout** in Android settings
4. **Set as homepage** for automatic loading

### For Phone/Laptop Access:
1. **Bookmark control URL:** `https://your-app.railway.app`
2. **Add to home screen** on mobile for app-like experience
3. **Works from anywhere** with internet connection

---

## 🔧 **Environment Variables**

For production deployment, set these environment variables:

```bash
NODE_ENV=production
PORT=3000  # Usually set automatically by hosting provider
```

---

## 📊 **Cost Comparison**

| Option | Monthly Cost | Reliability | Setup Difficulty |
|--------|-------------|-------------|------------------|
| **Railway** | **Free** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Render | Free* | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Heroku | $7 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Fly.io | Free | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Raspberry Pi | $0** | ⭐⭐⭐ | ⭐⭐ |
| VPS | $5-10 | ⭐⭐⭐⭐ | ⭐⭐ |

*Render free tier sleeps after inactivity  
**After initial hardware cost

---

## 🚀 **Quick Start - Railway Deployment**

1. **Push to GitHub:**
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/digital-whiteboard.git
git push -u origin main
```

2. **Deploy to Railway:**
- Go to [railway.app](https://railway.app)
- Click "Start a New Project"
- Choose "Deploy from GitHub repo"
- Select your repository
- Railway automatically detects and deploys!

3. **Access Your Whiteboard:**
- Control: `https://your-app-name.railway.app`
- Display: `https://your-app-name.railway.app/display`

---

## 🔒 **Security Considerations**

Since this will be publicly accessible:

1. **No sensitive data** - The app stores drawings/todos in memory only
2. **Consider adding basic auth** if you want privacy:

```javascript
// Add to server.js for basic protection
app.use((req, res, next) => {
  const auth = req.headers.authorization;
  if (!auth || auth !== 'Basic ' + Buffer.from('user:password').toString('base64')) {
    res.status(401).send('Authentication required');
    return;
  }
  next();
});
```

3. **Rate limiting** to prevent abuse:

```bash
npm install express-rate-limit
```

---

## 📈 **Monitoring & Maintenance**

### Health Checks:
- Railway automatically monitors your app
- Use the included `healthcheck.js` for custom monitoring

### Logs:
```bash
# Railway logs
railway logs

# Heroku logs
heroku logs --tail
```

### Updates:
- Simply push to your GitHub repo
- Railway auto-deploys on every push

---

**Recommendation:** Start with **Railway** for the best free experience, then consider a Raspberry Pi for long-term cost savings if you want a permanent home setup! 