<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${msg("loginTitle",(realm.displayName!''))}</title>
  <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    /* --- FOND DÉGRADÉ FIXE --- */
    body {
      font-family: 'Poppins', 'Segoe UI', sans-serif;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      position: relative;
      color: #fff;
      overflow: hidden;
      background: linear-gradient(135deg, #d22b2b, #28a745, #FFD700);
    }

    /* --- BANNIÈRE CITADEL (remplace le logo BBDA) --- */
    .citadel-banner {
      width: 100%;
      background: rgba(255, 255, 255, 0.95);
      padding: 15px 20px;
      border-radius: 12px;
      margin-bottom: 25px;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .citadel-banner img {
      max-width: 95%;
      height: auto;
      max-height: none;
      object-fit: contain;
      transform: scale(1.2);
    }

    /* --- CONTAINER LOGIN --- */
    .login-container {
      position: relative;
      z-index: 1;
      width: 100%;
      max-width: 420px;
      background: rgba(255,255,255,0.05);
      border-radius: 20px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.5);
      padding: 40px 35px;
      text-align: center;
      animation: fadeIn 0.6s ease-out;
      backdrop-filter: blur(15px);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* --- TITRES --- */
    .main-title {
      font-size: 28px;
      font-weight: 700;
      color: #FFD700; 
      letter-spacing: 0.5px;
      margin-bottom: 8px;
    }

    .subtitle {
      font-size: 15px;
      color: #F5F5F5; 
      font-weight: 400;
      margin-bottom: 25px;
    }

    /* --- INPUTS --- */
    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 100%;
      padding: 14px 16px;
      margin-bottom: 18px;
      border-radius: 10px;
      border: none;
      font-size: 15px;
      background: rgba(255,255,255,0.95);
      color: #333;
      transition: all 0.3s;
    }

    input:focus {
      outline: none;
      box-shadow: 0 0 0 3px rgba(255,215,0,0.3);
      background: #fff;
    }

    label {
      display: block;
      text-align: left;
      margin-bottom: 6px;
      font-size: 14px;
      font-weight: 500;
      color: #F5F5F5;
    }

    /* --- BUTTON --- */
    button,
    input[type="submit"] {
      width: 100%;
      padding: 14px;
      border-radius: 10px;
      border: none;
      background: linear-gradient(135deg, #d22b2b, #28a745);
      color: white;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
      text-transform: uppercase;
      box-shadow: 0 4px 15px rgba(210,43,43,0.4);
    }

    button:hover,
    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(40,167,69,0.6);
    }

    /* --- LINKS --- */
    a {
      color: #FFD700;
      text-decoration: none;
      font-size: 14px;
      transition: color 0.3s;
    }

    a:hover {
      color: #fff;
      text-decoration: underline;
    }

    /* --- ALERT --- */
    .alert {
      background: rgba(255, 255, 255, 0.1);
      border-left: 4px solid #FFD700;
      padding: 12px 16px;
      border-radius: 8px;
      margin-bottom: 20px;
      text-align: left;
      font-size: 14px;
    }

    /* --- FOOTER --- */
    footer {
      position: relative;
      z-index: 1;
      margin-top: 50px;
      font-size: 12.5px;
      color: #F5F5F5;
      text-align: center;
      line-height: 1.5;
    }

    footer span {
      color: #FFD700;
      font-weight: 600;
    }

    /* --- MOBILE --- */
    @media (max-width: 480px) {
      .login-container { padding: 30px 20px; }
      .main-title { font-size: 24px; }
      .citadel-banner {
        padding: 10px 15px;
      }
      .citadel-banner img {
        transform: scale(1.2);
      }
    }

    /* --- ANIMATION MUSICALE --- */
    .music-bars {
      position: absolute;
      bottom: 10%;
      display: flex;
      gap: 4px;
      z-index: 0;
      width: 60%;
      max-width: 400px;
      justify-content: center;
    }

    .bar {
      width: 6px;
      height: 20px;
      background: #FFD700;
      animation: bounce 1s infinite ease-in-out;
      border-radius: 2px;
    }

    .bar:nth-child(1) { animation-delay: 0s; }
    .bar:nth-child(2) { animation-delay: 0.2s; }
    .bar:nth-child(3) { animation-delay: 0.4s; }
    .bar:nth-child(4) { animation-delay: 0.6s; }
    .bar:nth-child(5) { animation-delay: 0.8s; }

    @keyframes bounce {
      0%, 100% { transform: scaleY(0.3); }
      50% { transform: scaleY(1); }
    }

  </style>
</head>

<body>
  <div class="login-container">
    <!-- Bannière CITADEL (remplace le logo BBDA) -->
    <div class="citadel-banner">
      <img src="${url.resourcesPath}/img/citadel-250x250-1.PNG" alt="CITADEL - Centre d'Excellence Interdisciplinaire en Intelligence Artificielle pour le Développement">
    </div>

    <h1 class="main-title">FASO SOUND</h1>
    <h3 class="subtitle">Plateforme de Surveillance Musicale — BBDA</h3>

    <#if displayMessage && message?has_content>
      <div class="alert">${kcSanitize(message.summary)?no_esc}</div>
    </#if>

    <#nested "form">

    <div style="margin-top:15px;">
      <#if auth?has_content && auth.showTryAnotherWayLink()>
        <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
          <input type="hidden" name="tryAnotherWay" value="on"/>
          <a href="#" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
        </form>
      </#if>
    </div>

    <#nested "socialProviders">
    <#if displayInfo><#nested "info"></#if>
  </div>


  <!-- Animation musicale -->
  <div class="music-bars">
    <div class="bar"></div>
    <div class="bar"></div>
    <div class="bar"></div>
    <div class="bar"></div>
    <div class="bar"></div>
  </div>

  <!-- Footer -->
  <footer>
    © 2025 <span> CITADEL</span> — Centre d'Excellence Interdisciplinaire en Intelligence Artificielle pour le Développement.<br>
    Tous droits réservés • <a href="https://citadel.bf/" target="_blank">www.citadel.bf</a>
  </footer>
</body>
</html>
</#macro>