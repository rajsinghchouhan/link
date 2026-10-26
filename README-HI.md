# LinkPilot Simple (GitHub Pages, bina Supabase)

Yeh version **login/dashboard ke bina** chalta hai. GitHub Pages static hosting hai, isliye sirf HTML se ek secure admin dashboard nahi ban sakta jo destination ko sab visitors ke liye save kare.

## Link kaise kaam karta hai?
- `go/offer/index.html` ka URL hoga: `https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/go/offer/`
- `go/demo/index.html` ka URL hoga: `https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/go/demo/`
- Abhi destinations example ke liye `https://example.com/offer` aur `https://example.org/` hain. Apne asli destination URL se replace karein.

## Destination kaise badlein?
1. GitHub par apni repository kholein.
2. `go/offer/index.html` (ya jis link ko badalna ho) kholein.
3. Pencil/Edit par click karein.
4. File mein destination URL ko **har jagah** replace karein: `content="0;url=..."`, `href="..."`, `location.replace("...")` aur canonical link.
5. Commit changes karein.
6. GitHub Pages deploy hone ke baad wahi short URL naye destination par jayega. Publish hone mein kuch minute lag sakte hain.

## Naya short link kaise banayein?
1. `go` ke andar naya folder banayein, jaise `go/newdeal/`.
2. Uske andar `index.html` banayein. `go/offer/index.html` ko copy karke destination URL badal dein.
3. Commit karein. Short URL `/go/newdeal/` hoga.

## GitHub Pages setup
1. ZIP ko extract karke files apni GitHub repository ke root mein upload karein.
2. Repository → **Settings → Pages** kholein.
3. **Deploy from a branch** choose karein, branch `main`, folder `/(root)` select karein, Save karein.
4. GitHub Pages URL milne ke baad link ko test karein.

## Zaroori baat
- Yeh **Supabase use nahi karta**, aur login bhi nahi hai.
- Dashboard par destination type karke save karne ki facility is static version mein nahi hai.
- Agar destination ko browser dashboard se badalna hai aur change sab users par turant apply karna hai, to Cloudflare Worker/KV ya koi backend chahiye.
- `example.com` aur `example.org` demo destinations hain; deploy karne se pehle apne URLs se replace karein.
