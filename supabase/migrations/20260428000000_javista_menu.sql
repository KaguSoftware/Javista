-- Javista Specialty Coffee — full menu seed
-- Wipes Upperdeck data and replaces it with Javista categories + items.

truncate table public.menu_items;
delete from public.categories;

do $$ declare
  cat_espresso_bar  uuid;
  cat_matcha_bar    uuid;
  cat_special       uuid;
  cat_brew_bar      uuid;
  cat_tea           uuid;
  cat_hot_drinks    uuid;
  cat_extras        uuid;
  cat_iced_espresso uuid;
  cat_frozen        uuid;
  cat_smoothie      uuid;
  cat_frappe        uuid;
  cat_iced_tea      uuid;
  cat_mocktail      uuid;
  cat_cold_bev      uuid;
  cat_salads        uuid;
  cat_croissants    uuid;
  cat_sandwiches    uuid;
  cat_cookies       uuid;
  cat_desserts      uuid;
begin

  -- ── CATEGORIES ──────────────────────────────────────────────────────────────
  insert into public.categories (slug, name_en, name_tr, sort_order) values
    ('espresso-bar',   'Espresso Bar',    'Espresso Bar',        10),
    ('matcha-bar',     'Matcha Bar',      'Matcha Bar',          20),
    ('special',        'Special',         'Seçkiler',            30),
    ('brew-bar',       'Brew Bar',        'Demleme Barı',        40),
    ('tea',            'Tea',             'Çay',                 50),
    ('hot-drinks',     'Hot Drinks',      'Sıcak İçecekler',     60),
    ('extras',         'Extras',          'Ekstralar',           70),
    ('iced-espresso',  'Iced Espresso',   'Soğuk Espresso',      80),
    ('frozen',         'Frozen',          'Frozen',              90),
    ('smoothie',       'Smoothie',        'Smoothie',           100),
    ('frappe',         'Frappé',          'Frappé',             110),
    ('iced-tea',       'Iced Tea',        'Ev Yapımı Ice Tea',  120),
    ('mocktail',       'Mocktail',        'Mocktail',           130),
    ('cold-beverages', 'Cold Beverages',  'Soğuk İçecekler',    140),
    ('salads',         'Salads',          'Salatalar',          150),
    ('croissants',     'Croissants',      'Kruvasanlar',        160),
    ('sandwiches',     'Sandwiches',      'Sandviçler',         170),
    ('cookies',        'Cookies',         'Kurabiyeler',        180),
    ('desserts',       'Desserts',        'Tatlılar',           190);

  select id into cat_espresso_bar  from public.categories where slug = 'espresso-bar';
  select id into cat_matcha_bar    from public.categories where slug = 'matcha-bar';
  select id into cat_special       from public.categories where slug = 'special';
  select id into cat_brew_bar      from public.categories where slug = 'brew-bar';
  select id into cat_tea           from public.categories where slug = 'tea';
  select id into cat_hot_drinks    from public.categories where slug = 'hot-drinks';
  select id into cat_extras        from public.categories where slug = 'extras';
  select id into cat_iced_espresso from public.categories where slug = 'iced-espresso';
  select id into cat_frozen        from public.categories where slug = 'frozen';
  select id into cat_smoothie      from public.categories where slug = 'smoothie';
  select id into cat_frappe        from public.categories where slug = 'frappe';
  select id into cat_iced_tea      from public.categories where slug = 'iced-tea';
  select id into cat_mocktail      from public.categories where slug = 'mocktail';
  select id into cat_cold_bev      from public.categories where slug = 'cold-beverages';
  select id into cat_salads        from public.categories where slug = 'salads';
  select id into cat_croissants    from public.categories where slug = 'croissants';
  select id into cat_sandwiches    from public.categories where slug = 'sandwiches';
  select id into cat_cookies       from public.categories where slug = 'cookies';
  select id into cat_desserts      from public.categories where slug = 'desserts';

  -- ── ESPRESSO BAR ────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_espresso_bar, 'Espresso',                  'Espresso',                  '☕', 'bold · pure · classic',          'yoğun · saf · klasik',               195,  10),
    (cat_espresso_bar, 'Double Espresso',            'Double Espresso',            '☕', 'double · strong · bold',         'çift · güçlü · cesur',               220,  20),
    (cat_espresso_bar, 'Ristretto',                  'Ristretto',                  '☕', 'concentrated · short · intense', 'yoğun · kısa · sert',                220,  30),
    (cat_espresso_bar, 'Espresso Macchiato',         'Espresso Macchiato',         '☕', 'marked · creamy · small',        'lekeli · kremalı · küçük',           200,  40),
    (cat_espresso_bar, 'Filter Coffee',              'Filtre Kahve',               '☕', 'smooth · clean · everyday',      'akıcı · temiz · günlük',             210,  50),
    (cat_espresso_bar, 'Americano',                  'Americano',                  '☕', 'long · clean · classic',         'uzun · temiz · klasik',              220,  60),
    (cat_espresso_bar, 'Cortado',                    'Cortado',                    '☕', 'balanced · milky · smooth',      'dengeli · sütlü · pürüzsüz',         230,  70),
    (cat_espresso_bar, 'Flat White',                 'Flat White',                 '☕', 'velvety · silky · strong',       'kadifemsi · ipeksi · güçlü',         240,  80),
    (cat_espresso_bar, 'Cappuccino',                 'Cappuccino',                 '☕', 'foamy · classic · warm',         'köpüklü · klasik · sıcak',           240,  90),
    (cat_espresso_bar, 'Cafe Latte',                 'Cafe Latte',                 '🥛', 'creamy · mellow · milky',        'kremalı · yumuşak · sütlü',          240, 100),
    (cat_espresso_bar, 'Flavored Latte',             'Aromalı Latte',              '🥛', 'vanilla · caramel · cookie',     'vanilya · karamel · kurabiye',       270, 110),
    (cat_espresso_bar, 'Chai Tea Latte',             'Chai Tea Latte',             '🍵', 'spiced · warm · aromatic',       'baharatlı · sıcak · aromatik',       270, 120),
    (cat_espresso_bar, 'Caramel Latte Macchiato',    'Caramel Latte Macchiato',    '🍮', 'caramel · layered · sweet',      'karamel · katmanlı · tatlı',         300, 130),
    (cat_espresso_bar, 'Mocha',                      'Mocha',                      '🍫', 'chocolate · rich · indulgent',   'çikolata · zengin · şımartıcı',      310, 140),
    (cat_espresso_bar, 'White Chocolate Mocha',      'Beyaz Çikolatalı Mocha',     '🤍', 'white · creamy · sweet',         'beyaz · kremalı · tatlı',            310, 150),
    (cat_espresso_bar, 'Zebra Mocha',                'Zebra Mocha',                '🦓', 'dark · white · stripes',         'koyu · beyaz · çizgili',             325, 160),
    (cat_espresso_bar, 'Türk Kahvesi',               'Türk Kahvesi',               '☕', 'traditional · foamy · strong',   'geleneksel · köpüklü · güçlü',       195, 170),
    (cat_espresso_bar, 'Double Türk Kahvesi',        'Double Türk Kahvesi',        '☕', 'double · traditional · strong',  'çift · geleneksel · güçlü',          315, 180);

  -- ── MATCHA BAR ──────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_matcha_bar, 'Matcha Latte',                      'Matcha Latte',                          '🍵', 'earthy · ceremonial · creamy',   'toprak · seremonik · kremalı',       300,  10),
    (cat_matcha_bar, 'Matcha Strawberry Latte',           'Matcha Çilekli Latte',                  '🍓', 'fruity · earthy · pink',         'meyveli · toprak · pembe',           370,  20),
    (cat_matcha_bar, 'Matcha Blueberry Latte',            'Matcha Yaban Mersinli Latte',           '🫐', 'berry · earthy · purple',        'meyveli · toprak · mor',             370,  30),
    (cat_matcha_bar, 'Matcha Vanilla Latte',              'Matcha Vanilyalı Latte',                '🌼', 'vanilla · creamy · gentle',      'vanilya · kremalı · yumuşak',        370,  40),
    (cat_matcha_bar, 'Matcha Coconut Latte',              'Matcha Hindistan Cevizli Latte',        '🥥', 'coconut · tropical · creamy',    'hindistan cevizi · tropikal · kremalı', 370, 50),
    (cat_matcha_bar, 'Matcha Mango Latte',                'Matcha Mangolu Latte',                  '🥭', 'mango · tropical · bright',      'mango · tropikal · canlı',           370,  60),
    (cat_matcha_bar, 'Matcha Cloud Coconut Latte',        'Matcha Cloud Hindistan Cevizli Latte',  '☁️', 'cloudy · airy · coconut',        'bulutlu · havadar · hindistan cevizi', 400, 70),
    (cat_matcha_bar, 'Hojicha Latte',                     'Hojicha Latte',                         '🍂', 'roasted · nutty · warm',         'kavrulmuş · cevizli · sıcak',        335,  80);

  -- ── SPECIAL ─────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_special, 'Spanish Latte',           'Spanish Latte',           '🥛', 'condensed · sweet · creamy',  'yoğunlaştırılmış · tatlı · kremalı', 315, 10),
    (cat_special, 'Lotus Latte',             'Lotus Latte',             '🍪', 'biscoff · caramel · spiced',  'biscoff · karamel · baharatlı',      315, 20),
    (cat_special, 'Coconut Latte',           'Hindistan Cevizli Latte', '🥥', 'coconut · tropical · creamy', 'hindistan cevizi · tropikal · kremalı', 310, 30),
    (cat_special, 'Pistachio Latte',         'Antep Fıstıklı Latte',    '🌰', 'pistachio · nutty · rich',    'antep fıstığı · cevizli · zengin',   335, 40),
    (cat_special, 'Tropicca',               'Tropicca',                '🌴', 'tropical · house · special',  'tropikal · özel · ev yapımı',        335, 50),
    (cat_special, 'Red Eye',                'Red Eye',                  '👁️', 'filter + 1 shot',             'filtre + 1 shot',                    275, 60),
    (cat_special, 'Black Eye',              'Black Eye',                '👁️', 'filter + 2 shots',            'filtre + 2 shot',                    300, 70);

  -- ── BREW BAR ────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_brew_bar, 'V60',           'V60',           '☕', 'pour-over · clean · single origin', 'pour-over · temiz · tek bölge', 330, 10),
    (cat_brew_bar, 'Chemex',        'Chemex',        '☕', 'clean · bright · clarity',          'temiz · parlak · berrak',       330, 20),
    (cat_brew_bar, 'Cold Brew',     'Cold Brew',     '🧊', 'smooth · slow · cold',              'pürüzsüz · yavaş · soğuk',      255, 30),
    (cat_brew_bar, 'Japanese Cold', 'Japanese Cold', '🇯🇵', 'iced · vibrant · bright',           'buzlu · canlı · parlak',        345, 40);

  -- ── TEA ─────────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_tea, 'Çay',             'Çay',            '🫖', 'classic · turkish · warm',    'klasik · türk · sıcak',          95,  10),
    (cat_tea, 'Fincan Çay',      'Fincan Çay',     '🍵', 'cup · turkish · classic',     'fincan · türk · klasik',        115,  20),
    (cat_tea, 'Ada Çay',         'Ada Çayı',       '🌿', 'sage · herbal · soothing',    'adaçayı · bitki · yatıştırıcı', 250,  30),
    (cat_tea, 'Linden',          'Ihlamur',        '🌼', 'linden · floral · calming',   'ıhlamur · çiçeksi · sakinleştirici', 250, 40),
    (cat_tea, 'Winter Tea',      'Kış Çayı',       '❄️', 'warming · spiced · winter',   'ısıtıcı · baharatlı · kış',     250,  50),
    (cat_tea, 'Apple Cinnamon',  'Elma Tarçın',    '🍎', 'apple · cinnamon · cozy',     'elma · tarçın · samimi',        250,  60),
    (cat_tea, 'Mint Lemon',      'Nane Limon',     '🍋', 'mint · lemon · fresh',        'nane · limon · taze',           250,  70),
    (cat_tea, 'Hibiscus',        'Hibiscus',       '🌺', 'hibiscus · tart · ruby',      'hibiscus · ekşi · yakut',       250,  80),
    (cat_tea, 'Mango Pineapple', 'Mango Ananas',   '🥭', 'tropical · sweet · vibrant',  'tropikal · tatlı · canlı',      250,  90),
    (cat_tea, 'Green Tea',       'Yeşil Çay',      '🍵', 'green · grassy · light',      'yeşil · otsu · hafif',          250, 100),
    (cat_tea, 'Detox',           'Detox',          '🌱', 'cleansing · herbal · fresh',   'arındırıcı · bitki · taze',     250, 110);

  -- ── HOT DRINKS ──────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_hot_drinks, 'Hot White Chocolate', 'Sıcak Beyaz Çikolata', '🤍', 'white · creamy · indulgent', 'beyaz · kremalı · şımartıcı',      435, 10),
    (cat_hot_drinks, 'Salep',              'Salep',                 '🌸', 'warm · spiced · traditional', 'sıcak · baharatlı · geleneksel',  245, 20),
    (cat_hot_drinks, 'Hot Milk',           'Sıcak Süt',             '🥛', 'warm · simple · soothing',    'sıcak · sade · yatıştırıcı',       95, 30);

  -- ── EXTRAS ──────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_extras, 'Aroma',          'Aroma',                    '✨', 'syrup · flavor · shot',      'şurup · aroma · shot',                  70, 10),
    (cat_extras, 'Espresso Shot',  'Espresso Shot',             '☕', 'extra · shot · bold',        'ekstra · shot · cesur',                 55, 20),
    (cat_extras, 'Honey',          'Bal',                       '🍯', 'natural · sweet · golden',   'doğal · tatlı · altın',                 45, 30),
    (cat_extras, 'Almond Milk',    'Badem Sütü',               '🥛', 'almond · plant · light',     'badem · bitkisel · hafif',              75, 40),
    (cat_extras, 'Oat Milk',       'Yulaf Sütü',               '🌾', 'oat · plant · creamy',       'yulaf · bitkisel · kremalı',            75, 50),
    (cat_extras, 'Coconut Milk',   'Hindistan Cevizi Sütü',    '🥥', 'coconut · plant · tropical', 'hindistan cevizi · bitkisel · tropikal', 75, 60),
    (cat_extras, 'Belgian Chocolate', 'Belçika Çikolatası',    '🍫', 'belgian · rich · luxurious', 'belçika · zengin · lüks',              110, 70);

  -- ── ICED ESPRESSO ───────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_iced_espresso, 'Iced Americano',           'Iced Americano',           '🧊', 'iced · clean · bold',         'buzlu · temiz · cesur',        225,  10),
    (cat_iced_espresso, 'Iced Latte',               'Iced Latte',               '🧊', 'iced · creamy · smooth',      'buzlu · kremalı · pürüzsüz',   255,  20),
    (cat_iced_espresso, 'Iced Cortado',             'Iced Cortado',             '🧊', 'iced · balanced · milky',     'buzlu · dengeli · sütlü',      245,  30),
    (cat_iced_espresso, 'Iced Flavored Latte',      'Iced Aromalı Latte',       '🧊', 'iced · vanilla · caramel',    'buzlu · vanilya · karamel',    290,  40),
    (cat_iced_espresso, 'Iced Spanish Latte',       'Iced Spanish Latte',       '🧊', 'iced · condensed · sweet',    'buzlu · yoğun · tatlı',        285,  50),
    (cat_iced_espresso, 'Iced Lotus Latte',         'Iced Lotus Latte',         '🍪', 'iced · biscoff · caramel',    'buzlu · biscoff · karamel',    330,  60),
    (cat_iced_espresso, 'Iced Lavender Latte',      'Iced Lavanta Latte',       '💜', 'lavender · floral · iced',    'lavanta · çiçeksi · buzlu',    330,  70),
    (cat_iced_espresso, 'Iced Chai Tea Latte',      'Iced Chai Tea Latte',      '🧊', 'iced · spiced · creamy',      'buzlu · baharatlı · kremalı',  285,  80),
    (cat_iced_espresso, 'Iced Filter Coffee',       'Iced Filtre Kahve',        '🧊', 'iced · clean · smooth',       'buzlu · temiz · pürüzsüz',     225,  90),
    (cat_iced_espresso, 'Iced Cappuccino',          'Iced Cappuccino',          '🧊', 'iced · foamy · classic',      'buzlu · köpüklü · klasik',     255, 100),
    (cat_iced_espresso, 'Iced Caramel Macchiato',   'Iced Caramel Macchiato',   '🍮', 'iced · caramel · layered',    'buzlu · karamel · katmanlı',   315, 110),
    (cat_iced_espresso, 'Iced Mocha',               'Iced Mocha',               '🧊', 'iced · chocolate · rich',     'buzlu · çikolata · zengin',    325, 120),
    (cat_iced_espresso, 'Iced White Mocha',         'Iced White Mocha',         '🤍', 'iced · white · creamy',       'buzlu · beyaz · kremalı',      325, 130),
    (cat_iced_espresso, 'Iced Zebra Mocha',         'Iced Zebra Mocha',         '🦓', 'iced · dark · white',         'buzlu · koyu · beyaz',         340, 140);

  -- ── FROZEN ──────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_frozen, 'Lime Vanilla',        'Lime Vanilla',             '🍋', 'lime · vanilla · frozen',          'lime · vanilya · frozen',              365, 10),
    (cat_frozen, 'Coconut Strawberry',  'Coconut Strawberry',       '🥥', 'coconut · strawberry · frozen',    'hindistan cevizi · çilek · frozen',     365, 20),
    (cat_frozen, 'Peach Lime',          'Şeftali Lime',             '🍑', 'peach · lime · frozen',            'şeftali · lime · frozen',               365, 30),
    (cat_frozen, 'Mint Lime',           'Mint Lime',                '🌿', 'mint · lime · frozen',             'nane · lime · frozen',                  365, 40),
    (cat_frozen, 'Blueberry Frozen',    'Yaban Mersinli Frozen',    '🫐', 'blueberry · cold · vibrant',       'yaban mersini · soğuk · canlı',         330, 50),
    (cat_frozen, 'Strawberry Frozen',   'Çilekli Frozen',           '🍓', 'strawberry · cold · sweet',        'çilek · soğuk · tatlı',                 330, 60),
    (cat_frozen, 'Mango Frozen',        'Mangolu Frozen',           '🥭', 'mango · cold · tropical',          'mango · soğuk · tropikal',              330, 70),
    (cat_frozen, 'Lime Frozen',         'Limeli Frozen',            '🍋', 'lime · cold · zesty',              'lime · soğuk · ferahlatıcı',            330, 80);

  -- ── SMOOTHIE ────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_smoothie, 'Peach Smoothie',      'Şeftali Smoothie',       '🍑', 'peach · smooth · creamy',     'şeftali · pürüzsüz · kremalı',    335, 10),
    (cat_smoothie, 'Strawberry Smoothie', 'Çilek Smoothie',         '🍓', 'strawberry · smooth · sweet', 'çilek · pürüzsüz · tatlı',        335, 20),
    (cat_smoothie, 'Blueberry Smoothie',  'Yaban Mersini Smoothie', '🫐', 'blueberry · smooth · vibrant','yaban mersini · pürüzsüz · canlı', 335, 30),
    (cat_smoothie, 'Mango Smoothie',      'Mango Smoothie',         '🥭', 'mango · smooth · tropical',   'mango · pürüzsüz · tropikal',     335, 40);

  -- ── FRAPPE ──────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_frappe, 'Chocolate Frappé',       'Çikolatalı Frappé',       '🍫', 'chocolate · blended · cold', 'çikolata · blendlı · soğuk',    345, 10),
    (cat_frappe, 'White Chocolate Frappé', 'Beyaz Çikolatalı Frappé', '🤍', 'white · blended · sweet',    'beyaz · blendlı · tatlı',       345, 20),
    (cat_frappe, 'Blueberry Frappé',       'Yaban Mersinli Frappé',   '🫐', 'blueberry · blended · cold', 'yaban mersini · blendlı · soğuk', 345, 30),
    (cat_frappe, 'Vanilla Frappé',         'Vanilyalı Frappé',        '🌼', 'vanilla · blended · creamy', 'vanilya · blendlı · kremalı',   345, 40);

  -- ── ICED TEA ────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_iced_tea, 'Peach Iced Tea',       'Şeftali Ice Tea',       '🍑', 'peach · iced · refreshing', 'şeftali · buzlu · ferahlatıcı', 315, 10),
    (cat_iced_tea, 'Mango Iced Tea',       'Mango Ice Tea',         '🥭', 'mango · iced · tropical',   'mango · buzlu · tropikal',      315, 20),
    (cat_iced_tea, 'Peach Lime Iced Tea',  'Şeftali Lime Ice Tea',  '🍋', 'peach · lime · iced',       'şeftali · lime · buzlu',        315, 30),
    (cat_iced_tea, 'Mango Lime Iced Tea',  'Mango Lime Ice Tea',    '🍋', 'mango · lime · iced',       'mango · lime · buzlu',          315, 40);

  -- ── MOCKTAIL ────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_mocktail, 'Butterfly',          'Butterfly',           '🦋', 'butterfly pea · blue · floral',    'kelebek bezelyesi · mavi · çiçeksi', 345, 10),
    (cat_mocktail, 'Passion',            'Passion',             '💛', 'passion fruit · tropical · tart',  'çarkıfelek · tropikal · ekşi',       345, 20),
    (cat_mocktail, 'Elixir',             'Elixir',              '✨', 'herbal · elixir · vibrant',         'bitki · iksir · canlı',              345, 30),
    (cat_mocktail, 'Signature Hibiscus', 'Signature Hibiscus',  '🌺', 'hibiscus · signature · ruby',       'hibiscus · imza · yakut',            355, 40),
    (cat_mocktail, 'Rooibos',            'Rooibos',             '🍂', 'rooibos · earthy · mellow',         'rooibos · toprak · yumuşak',         345, 50),
    (cat_mocktail, 'Espresso Tonic',     'Espresso Tonic',      '🧊', 'espresso · tonic · fizzy',          'espresso · tonik · gazlı',           330, 60),
    (cat_mocktail, 'Watermelon Burst',   'Watermelon Burst',    '🍉', 'watermelon · burst · juicy',        'karpuz · ferah · sulu',              325, 70),
    (cat_mocktail, 'Lime Up',            'Lime Up',             '🍋', 'lime · zesty · bright',             'lime · ferahlatıcı · parlak',        325, 80),
    (cat_mocktail, 'Cherry Hibiscus',    'Cherry Hibiscus',     '🍒', 'cherry · hibiscus · ruby',          'kiraz · hibiscus · yakut',           325, 90);

  -- ── COLD BEVERAGES ──────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_cold_bev, 'Uludağ Premium Su',    'Uludağ Premium Su',    '💧', 'still water · 400ml',         'düz su · 400ml',               80, 10),
    (cat_cold_bev, 'Uludağ Maden Suyu',   'Uludağ Maden Suyu',   '💧', 'sparkling · 200ml',           'gazlı · 200ml',               125, 20),
    (cat_cold_bev, 'S.Pellegrino',         'S.Pellegrino',         '💎', 'sparkling · italian · 330ml', 'gazlı · italyan · 330ml',     105, 30),
    (cat_cold_bev, 'Cherrish',             'Cherrish',             '🍒', 'cherry · fizzy · refreshing', 'kiraz · gazlı · ferahlatıcı', 115, 40),
    (cat_cold_bev, 'RedBull',              'RedBull',              '⚡', 'energy · classic · 250ml',    'enerji · klasik · 250ml',     170, 50),
    (cat_cold_bev, 'Lipton',               'Lipton',               '🧊', 'lipton · iced tea · classic', 'lipton · soğuk çay · klasik', 190, 60),
    (cat_cold_bev, 'Fresh Juice',          '100% Sıkma Meyve Suyu','🧃', 'fresh · pressed · 250ml',    'taze · sıkma · 250ml',        185, 70);

  -- ── SALADS ──────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_salads, 'Whey Salad',   'Whey Salad',   '🥗', 'whey · protein · fresh',  'whey · protein · taze',    395, 10),
    (cat_salads, 'Omega Salad',  'Omega Salad',  '🐟', 'omega · salmon · greens', 'omega · somon · yeşillik', 450, 20),
    (cat_salads, 'Caesar Salad', 'Caesar Salad', '🥬', 'caesar · classic · crisp', 'caesar · klasik · gevrek', 335, 30);

  -- ── CROISSANTS ──────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_croissants, 'Plain Croissant',           'Sade Kruvasan',        '🥐', 'plain · buttery · flaky',         'sade · tereyağlı · katmanlı',    255, 10),
    (cat_croissants, 'Smoked Turkey Croissant',   'Hindi Füme Kruvasan',  '🥪', 'smoked turkey · flaky · savory',  'hindi füme · katmanlı · lezzetli', 480, 20),
    (cat_croissants, 'Strawberry Cream Croissant','Krema Çilek Kruvasan', '🍓', 'strawberry · cream · sweet',      'çilek · krema · tatlı',          490, 30);

  -- ── SANDWICHES ──────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_sandwiches, 'Mozzarella Panini',        'Panini Mozzarella',     '🧀', 'mozzarella · pressed · warm',   'mozzarella · presli · sıcak',    350, 10),
    (cat_sandwiches, 'Smoked Turkey Sandwich',   'Hindi Füme Sandviç',    '🥪', 'smoked turkey · fresh · savory', 'hindi füme · taze · lezzetli',   340, 20),
    (cat_sandwiches, 'House Sandwich',           'Dudaklı Sandviç',       '🥪', 'house · classic · fresh',        'ev yapımı · klasik · taze',      350, 30),
    (cat_sandwiches, 'Cheese Bagel',             'Bagel Peynir',          '🥯', 'bagel · cheese · soft',          'bagel · peynir · yumuşak',       350, 40);

  -- ── COOKIES ─────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_cookies, 'Chocolate Chip Cookie',   'Çikolata Parçacıklı Kurabiye', '🍪', 'chocolate · chip · classic',  'çikolata · parçacık · klasik', 205, 10),
    (cat_cookies, 'Strawberry Cookie',       'Çilekli Kurabiye',             '🍓', 'strawberry · sweet · soft',   'çilek · tatlı · yumuşak',      205, 20),
    (cat_cookies, 'Double Chocolate Cookie', 'Çift Çikolatalı Kurabiye',     '🍫', 'double · chocolate · rich',   'çift · çikolata · zengin',     205, 30);

  -- ── DESSERTS ────────────────────────────────────────────────────────────────
  insert into public.menu_items (category_id, name_en, name_tr, emoji, hook_en, hook_tr, price, sort_order) values
    (cat_desserts, 'Dubai Cup',               'Dubai Cup',               '🍮', 'dubai · pistachio · trend',       'dubai · antep fıstığı · trend',    150,  10),
    (cat_desserts, 'Almond Fit Cake',         'Badem Unu Fit Kek',       '🌰', 'almond · fit · light',            'badem · fit · hafif',              340,  20),
    (cat_desserts, 'San Sebastian',           'San Sebastian',           '🍰', 'basque · burnt · creamy',         'bask · yanık · kremalı',           325,  30),
    (cat_desserts, 'Milasır Bar',             'Milasır Bar',             '✨', 'milasır · special · share',       'milasır · özel · paylaşımlık',     880,  40),
    (cat_desserts, 'Tiramisu Cup',            'Tiramisu Cup',            '☕', 'tiramisu · coffee · creamy',      'tiramisu · kahve · kremalı',       340,  50),
    (cat_desserts, 'Raspberry Cheesecake',    'Ahududulu Cheesecake',    '🍰', 'raspberry · cheesecake · tart',   'ahududu · cheesecake · ekşi',      345,  60),
    (cat_desserts, 'Lotus Cheesecake',        'Lotus Cheesecake',        '🍪', 'lotus · biscoff · creamy',        'lotus · biscoff · kremalı',        345,  70),
    (cat_desserts, 'Nutella Cheesecake',      'Nutella Cheesecake',      '🍫', 'nutella · chocolate · rich',      'nutella · çikolata · zengin',      360,  80),
    (cat_desserts, 'Cookie Brownie',          'Cookie Brownie',          '🍪', 'cookie · brownie · fudgy',        'kurabiye · brownie · yoğun',       350,  90),
    (cat_desserts, 'Cherry Brownie',          'Vişneli Brownie',         '🍒', 'cherry · brownie · tart',         'vişne · brownie · ekşi',           350, 100),
    (cat_desserts, 'White Chocolate Brownie', 'Beyaz Çikolatalı Brownie','🤍', 'white · brownie · sweet',         'beyaz · brownie · tatlı',          340, 110),
    (cat_desserts, 'Berliner',                'Berliner',                '🍩', 'berliner · doughnut · jam',       'berliner · çörek · reçel',         250, 120);

end $$;
