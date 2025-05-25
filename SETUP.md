# Quick Setup Guide

## 🚀 Get Started in 3 Steps

### 1. Install Dependencies
```bash
npm install
```

### 2. Choose Your Access Method

#### 🏠 Local Network Only (Recommended)
```bash
./start-local.sh
```
- ✅ Fastest performance
- ✅ Most secure
- ✅ Works offline

#### 🌐 Public Internet Access
```bash
# One-time setup
cp start-public.sample.sh start-public.sh
chmod +x start-public.sh

# Edit start-public.sh and follow the ngrok setup instructions
# Then run:
./start-public.sh
```
- ✅ Access from anywhere
- ✅ Share with others
- ⚠️ Requires ngrok account

### 3. Open the Interfaces

**On your control device (phone/laptop):**
- Local: `http://YOUR_IP:3000`
- Public: `https://abc123.ngrok.io`

**On your display device (tablet):**
- Local: `http://YOUR_IP:3000/display.html`
- Public: `https://abc123.ngrok.io/display.html`

## 📱 Tablet Setup Tips

1. **Add to home screen** for full-screen experience
2. **Set screen timeout to "Never"**
3. **Keep plugged in** for best performance
4. **Use landscape orientation**

## 🔧 Troubleshooting

- **Can't connect?** Check firewall settings
- **Slow performance?** Use local network mode
- **ngrok issues?** Check authentication setup

For detailed instructions, see [README.md](README.md) 