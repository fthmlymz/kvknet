object ServerMod: TServerMod
  OnCreate = UniGUIServerModuleCreate
  OnDestroy = UniGUIServerModuleDestroy
  AutoCoInitialize = True
  TempFolder = 'temp\'
  Port = 8888
  Title = 'KVKNET - Ki'#351'isel Veri Envanteri Y'#246'netim Sistemi'
  DefaultImageFormat = cfPNG
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomCSS.Strings = (
    '.x-grid-group-hd {'
    '  background-color: yellowgreen;'
    '}'
    ''
    '.x-grid-group-title {'
    '  color: black;'
    '}'
    '')
  CustomMeta.Strings = (
    '<script language="JavaScript">'
    'function redirectHttpToHttps()'
    '{'
    '    var loc = window.location.href+'#39#39';'
    '    if (loc.indexOf('#39'http://'#39')==0){'
    '      window.location.href = loc.replace('#39'http://'#39','#39'https://'#39');'
    '    }'
    '}'
    'redirectHttpToHttps();'
    '</script>')
  ServerMessages.UnavailableErrMsg = #304'leti'#351'im Hatas'#305
  ServerMessages.LoadingMessage = 'Y'#252'kleniyor...'
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">Sistemde bir sorun ol' +
      'u'#351'tu : </p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>KVKNET Uygulamas'#305'na Geri D'#246'n</a></p>'
    '<br><br>'
    
      '<p style="text-align:center;color:#A05050"><a href="https://www.' +
      'kvknet.com.tr/">KVKNET WEB S'#304'TES'#304'</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>KVKNET Uygulamas'#305'na Geri D'#246'n</a></p>'
    '<br><br>'
    
      '<p style="text-align:center;color:#A05050"><a href="https://www.' +
      'kvknet.com.tr/">KVKNET WEB S'#304'TES'#304'</a></p>'
    '</body>'
    '</html>')
  ServerMessages.TerminateTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>KVKNET Uygulamas'#305'na Geri D'#246'n</a></p>'
    '<br><br>'
    
      '<p style="text-align:center;color:#A05050"><a href="https://www.' +
      'kvknet.com.tr/">KVKNET WEB S'#304'TES'#304'</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionMessage = 'Hatal'#305' oturum veya i'#351'lem s'#252'resi doldu.'
  ServerMessages.TerminateMessage = 'Oturum kapat'#305'ld'#305'.'
  AllowWebMonitor = False
  ExtLocale = 'tr'
  ServerLimits.ThreadPoolSize = 500
  ServerLimits.MaxSessions = 500
  ServerLimits.MaxRequests = 500
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_2
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_2]
  SSL.SSLOptions.Mode = sslmServer
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  SSL.SSLPort = 443
  Options = [soAutoPlatformSwitch, soWipeShadowSessions]
  ExOptions.XFrameOptions = uxoSameOrigin
  ConnectionFailureRecovery.ErrorMessage = 'Ba'#287'lant'#305' Hatas'#305
  ConnectionFailureRecovery.RetryMessage = 'Tekrar ba'#287'lan'#305'yor...'
  OnBeforeInit = UniGUIServerModuleBeforeInit
  OnHTTPCommand = UniGUIServerModuleHTTPCommand
  Height = 150
  Width = 215
end
