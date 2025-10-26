object FrmRiskHesapInfo: TFrmRiskHesapInfo
  Left = 0
  Top = 0
  ClientHeight = 545
  ClientWidth = 980
  Caption = 'Risk Hesap '#304'nfo'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 497
    Width = 980
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      980
      48)
    object btnexit: TUniBitBtn
      Left = 838
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = #199#305'k'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnexitClick
    end
  end
  object UniHTMLFrame1: TUniHTMLFrame
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 970
    Height = 487
    Hint = ''
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    HTML.Strings = (
      '<!DOCTYPE html>'
      '<html lang="tr">'
      '<head>'
      '    <meta charset="UTF-8">'
      
        '    <meta name="viewport" content="width=device-width, initial-s' +
        'cale=1.0">'
      '    <title>Risk De'#287'erlendirme Metotlar'#305'</title>'
      '<style>'
      '        body {'
      '            font-family: Arial, sans-serif;'
      '            line-height: 1.8;'
      '            color: #333;'
      '            margin: 20px;'
      '        }'
      '        h1, h2 {'
      '            color: #0056b3;'
      '            margin-top: 30px;'
      '            margin-bottom: 20px;'
      '        }'
      '        h1 {'
      '            text-align: center;'
      '            font-size: 24px;'
      '        }'
      '        h2 {'
      '            font-size: 20px;'
      '        }'
      '        p {'
      '            margin: 15px 0;'
      '        }'
      '        ul, ol {'
      '            margin: 15px 0 15px 40px;'
      '        }'
      '        li {'
      '            margin-bottom: 5px;'
      '        }'
      '        table {'
      '            width: 100%;'
      '            border-collapse: collapse;'
      '            margin-top: 20px;'
      '            margin-bottom: 20px;'
      '        }'
      '        table, th, td {'
      '            border: 1px solid #ccc;'
      '        }'
      '        th, td {'
      '            padding: 10px;'
      '            text-align: left;'
      '        }'
      '        th {'
      '            background-color: #f2f2f2;'
      '        }'
      '    </style>'
      '</head>'
      '<body>'
      '    <h1>Risk De'#287'erlendirme Metotlar'#305'</h1>'
      ''
      '    <h2>L Tipi Matris</h2>'
      '    <p>'
      
        '        L Tipi Matris (5x5), risk de'#287'erlendirmelerinde kullan'#305'la' +
        'n basit ve etkili bir y'#246'ntemdir. Bu metot, riskleri '#246'nceliklendi' +
        'rmek i'#231'in olas'#305'l'#305'k (O) ve '#351'iddet (S) parametrelerini de'#287'erlendir' +
        'ir. Hesaplama '#351'u '#351'ekilde yap'#305'l'#305'r:'
      '    </p>'
      '    <p><strong>Risk Skoru (R):</strong> R = O '#215' S</p>'
      '    <ul>'
      
        '        <li><strong>O (Olas'#305'l'#305'k):</strong> Riskin ger'#231'ekle'#351'me ih' +
        'timali (1 ile 5 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      '            <li> '#199'ok D'#252#351#252'k Olas'#305'l'#305'k</li>'
      '            <li> D'#252#351#252'k Olas'#305'l'#305'k</li>'
      '            <li> Orta Olas'#305'l'#305'k</li>'
      '            <li> Y'#252'ksek Olas'#305'l'#305'k</li>'
      '            <li> '#199'ok Y'#252'ksek Olas'#305'l'#305'k</li>'
      '        </ol>'
      
        '        <li><strong>S ('#350'iddet):</strong> Riskin etkisinin b'#252'y'#252'kl' +
        #252#287#252' (1 ile 5 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      '            <li> '#199'ok D'#252#351#252'k Etki</li>'
      '            <li> D'#252#351#252'k Etki</li>'
      '            <li> Orta Etki</li>'
      '            <li> Y'#252'ksek Etki</li>'
      '            <li> '#199'ok Y'#252'ksek Etki</li>'
      '        </ol>'
      '    </ul>'
      
        '    <p>Elde edilen risk skorlar'#305' a'#351'a'#287#305'daki gibi s'#305'n'#305'fland'#305'r'#305'l'#305'r.' +
        ' Bu sayede hangi risklerin '#246'ncelikli ele al'#305'nmas'#305' gerekti'#287'i beli' +
        'rlenir.</p>'
      '    <table>'
      '        <thead>'
      '            <tr>'
      '                <th>Risk Skoru (R)</th>'
      '                <th>Risk Seviyesi</th>'
      '            </tr>'
      '        </thead>'
      '        <tbody>'
      '            <tr>'
      '                <td>R < 5</td>'
      '                <td>D'#252#351#252'k Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>5 '#8804' R '#8804' 10</td>'
      '                <td>Kabul Edilebilir Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>11 '#8804' R '#8804' 15</td>'
      '                <td>Orta Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>16 '#8804' R '#8804' 20</td>'
      '                <td>Y'#252'ksek Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>R > 20</td>'
      '                <td>Kritik Risk</td>'
      '            </tr>'
      '        </tbody>'
      '    </table>'
      ''
      '    <h2>FMEA (Hata T'#252'r'#252' ve Etkileri Analizi)</h2>'
      '    <p>'
      
        '        FMEA, bir sistem, s'#252're'#231' veya '#252'r'#252'n i'#231'erisindeki olas'#305' hat' +
        'alar'#305'n etkilerini ve bu hatalar'#305'n olu'#351'ma nedenlerini analiz etme' +
        'k i'#231'in kullan'#305'lan bir risk y'#246'netimi y'#246'ntemidir. Ad'#305'mlar '#351'unlard'#305 +
        'r:'
      '    </p>'
      '    <ol>'
      '        <li>Hata t'#252'rlerini tan'#305'mlama.</li>'
      '        <li>Risk '#214'ncelik Numaras'#305' (R) hesaplama:</li>'
      '    </ol>'
      '    <p><strong>Risk Skoru (R):</strong> R = O '#215' S '#215' F</p>'
      '      <ul>'
      
        '        <li><strong>O (Olas'#305'l'#305'k):</strong> Riskin ger'#231'ekle'#351'me ih' +
        'timali (1 ile 5 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      '            <li> '#199'ok D'#252#351#252'k Olas'#305'l'#305'k</li>'
      '            <li> D'#252#351#252'k Olas'#305'l'#305'k</li>'
      '            <li> Orta Olas'#305'l'#305'k</li>'
      '            <li> Y'#252'ksek Olas'#305'l'#305'k</li>'
      '            <li> '#199'ok Y'#252'ksek Olas'#305'l'#305'k</li>'
      '        </ol>'
      
        '        <li><strong>S ('#350'iddet):</strong> Riskin etkisinin b'#252'y'#252'kl' +
        #252#287#252' (1 ile 5 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      '            <li> '#199'ok D'#252#351#252'k Etki</li>'
      '            <li> D'#252#351#252'k Etki</li>'
      '            <li> Orta Etki</li>'
      '            <li> Y'#252'ksek Etki</li>'
      '            <li> '#199'ok Y'#252'ksek Etki</li>'
      '        </ol>'
      
        #9#9'<li><strong>F (Farkedilebilirlik):</strong> Hatan'#305'n tespit edi' +
        'lme olas'#305'l'#305#287#305' (1 ile 5 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      '            <li> '#199'ok y'#252'ksek hemen fark edilir. </li>'
      '            <li> Y'#252'ksek genelde fark edilir. </li>'
      '            <li> Orta '#231'o'#287'u zaman fark edilir. </li>'
      '            <li> D'#252#351#252'k Nadiren fark edilir. </li>'
      '            <li> '#199'ok d'#252#351#252'k hi'#231' fark edilmez.</li>'
      '        </ol>'
      '    </ul>'
      #9
      
        '    <p>Elde edilen risk skorlar'#305' a'#351'a'#287#305'daki gibi s'#305'n'#305'fland'#305'r'#305'l'#305'r.' +
        ' Bu sayede hangi risklerin '#246'ncelikli ele al'#305'nmas'#305' gerekti'#287'i beli' +
        'rlenir.</p>'
      #9'<table>'
      '        <thead>'
      '            <tr>'
      '                <th>Risk Skoru (R)</th>'
      '                <th>Risk Seviyesi</th>'
      '            </tr>'
      '        </thead>'
      '        <tbody>'
      '            <tr>'
      '                <td>R < 25</td>'
      '                <td>D'#252#351#252'k Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>25 '#8804' R '#8804' 50</td>'
      '                <td>Kabul Edilebilir Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>50 '#8804' R '#8804' 45</td>'
      '                <td>Orta Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>75 '#8804' R '#8804' 100</td>'
      '                <td>Y'#252'ksek Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>R > 10</td>'
      '                <td>Kritik Risk</td>'
      '            </tr>'
      '        </tbody>'
      '    </table>'
      ''
      '    <h2>Fine-Kinney Metodu</h2>'
      '    <p>'
      
        '        Fine-Kinney, risk de'#287'erlendirmelerinde kullan'#305'lan bir me' +
        'tottur. Risk seviyelerini hesaplamak i'#231'in olas'#305'l'#305'k (O), frekans ' +
        '(F) ve '#351'iddet (S) dikkate al'#305'n'#305'r.'
      '    </p>'
      '    <p><strong>Risk Skoru (R):</strong> R = O '#215' F '#215' S</p>'
      '    <!-- Devam'#305'nda di'#287'er veriler ve tablolar eklenir -->'
      #9'<ul>'
      
        '        <li><strong>O (Olas'#305'l'#305'k):</strong> Riskin ger'#231'ekle'#351'me ih' +
        'timali (1 ile 6 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      '            <li> 0.2 '#8211' Beklenmez</li>'
      '            <li> 0.5 - Beklenmez fakat m'#252'mk'#252'n </li>'
      '            <li> 1 - M'#252'mk'#252'n fakat d'#252#351#252'k</li>'
      '            <li> 3 '#8211' Olas'#305'</li>'
      '            <li> 6 '#8211' Y'#252'ksek</li>'
      '            <li> 10 - Kesin</li>'
      '        </ol>'
      
        '        <li><strong>S ('#350'iddet):</strong> Riskin etkisinin b'#252'y'#252'kl' +
        #252#287#252' (1 ile 6 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      
        '            <li> 1 - '#214'nemsiz (hi'#231'bir etki yok, operasyon etkilen' +
        'mez)'#39'</li>'
      
        #9#9#9'<li> 3 - K'#252#231#252'k (ge'#231'ici hizmet kesintisi, minimal veri kayb'#305')'#39 +
        '</li>'
      
        #9#9#9'<li> 5 - Orta (k'#305'sa s'#252'reli hizmet kayb'#305', k'#252#231#252'k bir veri ihlal' +
        'i)'#39'</li>'
      
        #9#9#9'<li> 10 - B'#252'y'#252'k (sistemlerin durmas'#305', hassas verilerin kayb'#305')' +
        #39'</li>'
      
        #9#9#9'<li> 15 - '#199'ok b'#252'y'#252'k ('#246'nemli i'#351' s'#252're'#231'lerinin durmas'#305', m'#252#351'teri ' +
        'etkisi)'#39'</li>'
      
        #9#9#9'<li> 100 - Kritik (b'#252'y'#252'k veri ihlali, itibar kayb'#305', cezai yap' +
        't'#305'r'#305'm riski)</li>'
      '        </ol>    '
      
        #9#9'<li><strong>F (Frekans):</strong> Risk ile ne s'#305'kl'#305'kla ka'#351#305'la'#351 +
        #305'ld'#305#287#305' (1 ile 6 aras'#305'nda bir de'#287'er al'#305'r).</li>'
      '        <ol>'
      #9#9#9'<li> 0.5 - '#199'ok seyrek (y'#305'lda bir veya daha seyrek)</li>'
      #9#9#9'<li> 1 - Seyrek (y'#305'lda birka'#231' defa)</li>'
      #9#9#9'<li> 2 - S'#305'k de'#287'il (ayda bir veya birka'#231' defa)</li>'
      #9#9#9'<li> 3 - Ara s'#305'ra (haftada bir veya birka'#231' defa)</li>'
      #9#9#9'<li> 6 - S'#305'k (g'#252'nde bir veya birka'#231' defa)</li>'
      #9#9#9'<li> 10 - Hemen s'#252'rekli tekrar</li>'
      '        </ol>'
      '    </ul>'
      #9
      
        '    <p>Elde edilen risk skorlar'#305' a'#351'a'#287#305'daki gibi s'#305'n'#305'fland'#305'r'#305'l'#305'r.' +
        ' Bu sayede hangi risklerin '#246'ncelikli ele al'#305'nmas'#305' gerekti'#287'i beli' +
        'rlenir.</p>'
      #9'<table>'
      '        <thead>'
      '            <tr>'
      '                <th>Risk Skoru (R)</th>'
      '                <th>Risk Seviyesi</th>'
      '            </tr>'
      '        </thead>'
      '        <tbody>'
      '            <tr>'
      '                <td>R < 200</td>'
      '                <td>D'#252#351#252'k Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>200 '#8804' R '#8804' 400</td>'
      '                <td>Kabul Edilebilir Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>400 '#8804' R '#8804' 600</td>'
      '                <td>Orta Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>600 '#8804' R '#8804' 800</td>'
      '                <td>Y'#252'ksek Risk</td>'
      '            </tr>'
      '            <tr>'
      '                <td>R > 800</td>'
      '                <td>Kritik Risk</td>'
      '            </tr>'
      '        </tbody>'
      '    </table>'
      '</body>'
      '</html>')
    AutoScroll = True
    Align = alClient
    ScrollHeight = 487
    ScrollWidth = 970
  end
end
