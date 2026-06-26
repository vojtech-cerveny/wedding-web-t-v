# svatba.ff0000.cz — stránka pro stažení aplikace

Jednoduchá statická stránka, ze které si hosté stáhnou Android aplikaci
**Suchankowie** (`svatebni.apk`). Cílí na ni QR kód.

## Struktura

```
public/
  index.html      # stránka (logo + tlačítko ke stažení + návod)
  icon.png        # logo aplikace
  svatebni.apk    # instalační soubor (~23 MB)
Dockerfile        # nginx, který servíruje složku public/
nginx.conf        # správný MIME typ pro .apk + vynucené stažení
```

## Nasazení na Coolify

1. V Coolify vytvoř novou **Application**.
2. Build Pack: **Dockerfile** (Coolify najde `Dockerfile` v rootu repa).
3. Port: **80**.
4. Domain: `https://svatba.ff0000.cz` (Coolify zařídí HTTPS přes Let's Encrypt).
5. Deploy.

> APK je součástí repozitáře, takže deploy z gitu funguje bez dalších kroků.
> Po aktualizaci aplikace stačí přepsat `public/svatebni.apk` a znovu nasadit.

## Lokální test

```bash
docker build -t svatba-web .
docker run --rm -p 8080:80 svatba-web
# → http://localhost:8080
```
