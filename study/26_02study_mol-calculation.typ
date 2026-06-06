#import "@preview/rubber-article:0.5.2": *
#import "@preview/cetz:0.4.2"
#show: article.with(lang:"ja", text-size:10.5pt)
#set text(font: ("New Computer Modern", "Noto Serif JP"), weight: 450)
#show heading: set text(font: ("Inter 18pt", "Noto Sans JP"), weight: 450)
#show strong: set text(font: ("Inter 18pt", "Noto Sans JP"), weight: 300)
#set par(first-line-indent: 1em, spacing: 1em, leading: 0.8em)
#set heading(numbering: "1.")
#set par(leading: 1em)
#show figure.where(
  kind: table
): set figure.caption(position: top)
#set footnote(numbering: n => sym.dagger + str(n) + h(3pt))
#set math.equation(
  numbering: "(1)",
  supplement: [Eq.]
)
#let abstract(body) = {
  set text(size: 0.9em)
  pad(x: 3em)[
    #align(center)[#text(weight: "bold", size: 1.1em)[*概要*]]
    #v(0.5em)
    #body
  ]
}
#show link: set text(fill: blue)
#show outline: set text(fill: blue)

#set page(
  paper: "a4",
  numbering: "1",
)

#show heading: it => {
    it
    par(text(size: 0em, ""))
}

#let cyan = rgb("#00B0F0")
#let magenta = rgb("#FF42A1")
#let orange = rgb("#ED7D31")

#maketitle(
  title: "単位換算とモル計算",
  authors: (
    "寺谷優輝",
  ),
  date: datetime.today().display("[year]年[month padding:none]月[day padding:none]日"),
)

#v(-2em)

#abstract[
  本稿では，モル計算と濃度計算を扱う．当然ながら，試薬の調整で必要な知識である．
  微生物を扱う上では，寒天培地をつくる際に*どのくらいの寒天が必要なのか？*，植物の成分抽出をする上では，*エタノールの濃度はどのくらいが適切なのか？*などを考える必要がある．
  これらの計算ができない限り，実験系を組むことができず実験のスタートラインに立てない．そのため，まずは計算できるようになることを目的とする．

  化学Chemistryの基本的な考え方は，*すべての物質は粒で構成されている*ということである．
  その粒の構造や運動を，*実験的に導かれ*帰納的に体系化されていることを忘れないで欲しい．
]

#outline(title: text(fill:black)[目次])

#pagebreak()

= 国際単位系International System of units

*科学Science*の世界では，測定や計算に*国際単位系*という国際的に統一された単位系を使用する．
この単位系を用いて*数値と単位の組*でデータを示す．この組のことを*物理量*Physical quantityという．
7つの*基本単位*を組み合わせて*組立単位*にすることで，さまざまな単位を作ることができる．
組立単位を知ることによって，求めたい単位に変える*単位換算*Unit conversionを行うことができるようになる．

#set heading(numbering: "1.1")

#let cancel(body, color) = context {
  let size = measure(body)
  box(
    stroke: 0.5pt + color,
    outset: (left: 1pt, right: 1pt, top: -size.height/2, bottom: -size.height/2),
    body
  )
}

#let cancel(body, color) = text(fill: color, strike(stroke: 0.5pt + color, text(fill: black, body)))

== 基本単位Basic units <sec:basic_units>

基本単位は次の7つである．

#figure(
  table(
    columns: (auto, auto, auto),
    align: (right, left, left),
    stroke: none,
    table.hline(stroke: 0.5pt),
    [データの種類], [英語], [単位],
    table.hline(stroke: 0.5pt),
    [時間], [#text(fill: cyan)[$t$]ime], [[s]],
    [距離], [#text(fill: cyan)[$r$]oute], [[m]],
    [電流], [#text(fill: cyan)[$I$]ntensity of current], [[A]],
    [質量], [#text(fill: cyan)[$m$]ass], [[kg]],
    [絶対温度], [#text(fill: cyan)[$T$]emperture], [[K]],
    [物質量], [#text(fill: cyan)[$n$]umber], [[mol]],
    [光度], [Luminous #text(fill: cyan)[$I$]ntensity], [[cd]],
    table.hline(stroke: 0.5pt),
  ),
  caption: [基本単位],
) <tab:basic_units>

　モル計算や濃度計算においては，*質量*$m$ [kg]，*物質量*$n$ [mol]のみ登場する．
それ以外は参考として載せておくので，眺めてみると良いだろう．

== 物質量Amount of substance

原子1粒同士を比較しても，非常に小さいため明確に重さの違いは分からない．しかし，何万，何億の粒を集めて比較すると，違いが分かるようになる．
かつては，炭素原子を基準として12 [g]になるために必要な数である#highlight(fill: yellow)[$6.022 times 10^(23)$個(アボカドロ数)]を1 [mol]としていた．ただし，「炭素」依存での定義であり普遍性に欠ける．

ここでアボガドロ定数$N_A$を$6.022,140,76 times 10^(23)$ [/mol]と定義することで，単位の大きさを定めた．
簡単に言えば，原子や分子の粒を$N_A$個のことを1 [mol]と置いた．この考えは，12個を1ダースと置くのと同じである．

== 接頭辞Prefix <sec:prefix>

接頭辞とは，基本単位よりも*大きい・小さいことを表す指標*のことである．
Si接尾辞では$times 10^(plus.minus 30)$まで定まっているが，よく使われる$times 10^(plus.minus 12)$までを紹介する．

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: center,
    stroke: none,
    table.hline(stroke: 0.5pt),
    [$(+)$接頭辞], [英語], [指数乗], [$(-)$接頭辞], [英語], [指数乗],
    table.hline(stroke: 0.5pt),
    [T], [#text(fill: cyan)[T]era], [$times 10^(12)$], [p], [#text(fill: cyan)[p]ico], [$times 10^(-12)$],
    [G], [#text(fill: cyan)[G]iga], [$times 10^9$], [n], [#text(fill: cyan)[n]ano], [$times 10^(-9)$],
    [M], [#text(fill: cyan)[M]ega], [$times 10^6$], [$mu$], [micro], [$times 10^(-6)$],
    [k], [#text(fill: cyan)[k]ilo], [$times 10^3$], [m], [#text(fill: cyan)[m]illi], [$times 10^(-3)$],
    [h], [#text(fill: cyan)[h]ecto], [$times 10^2$], [c], [#text(fill: cyan)[c]enti], [$times 10^(-2)$],
    [da], [#text(fill: cyan)[d]ec#text(fill: cyan)[a]], [$times 10^1$], [d], [#text(fill: cyan)[d]eci], [$times 10^(-1)$],
    table.hline(stroke: 0.5pt),
  ),
  caption: [Si接頭辞],
) <tab:prefix>

　マイナス乗は，プラス乗にすると*逆数*になる．例えば，$10^(-6)$は$1 / 10^6$である．
また，$10^(-6)$は$mu$と置き換えられる．この考え方ができるようになると，単位換算が容易になる．

== 単位換算Unit conversion <sec:convertion>

単位は，*定義に基づいて*組み立てることで新しい単位ができる．
基本的には，*同じ意味を持つもの同士を分母と分子に置き*，#text(fill: cyan)[*約分する*]ことで求めたい単位へと変える．
@eq:uc-1 は，「*1日は何秒か？*」を求めたものである．恐らく，一度は計算したことがあるだろう．

$ 1 ["day"] = 1 cancel(["day"], orange) times (24 cancel(["hr"], cyan)) / (1 cancel(["day"], orange)) times (60 cancel(["min"], magenta)) / (1 cancel(["hr"], cyan)) times (60 ["sec"]) / (1 cancel(["min"], magenta)) = 86,400 ["sec"] $ <eq:uc-1>

　単位換算を行う上で押さえるポイントは，最初の単位と*求めたい単位に注目し*
定義として*どの物理量同士が等しいか*考え約分する必要がある．
今回の場合，1 [day] と 24 [hr]は定義より等しいので，分母と分子に置くことで理論上約分でき1と同じ意味となる．

　次に、@sec:prefix の接頭辞を用いた単位換算を扱う．一例として，[mL]を[L]に変える場合を考える．

$ 1,000 [#text(fill: cyan)[m]"L"] = 1,000 times #text(fill: cyan)[$10^(-3)$] ["L"] = 1 ["L"] $ <eq:uc-2>

[mL]の#text(fill: cyan)[m]は，@tab:prefix を参照すると指数乗は#text(fill: cyan)[$10^(-3)$]である．
そのため，まず*接頭辞を指数乗に変える*．そのあと，指数乗を掛けることで単位を換算できる．

当然ながら接頭辞を付けたす場合は，その指数乗の符号を変えたものを掛ければよい．一例として，@eq:uc-2 の逆を考える．

$ 1 ["L"] = 1 times 10^(#text(fill: cyan)[$+3$]) [#text(fill: cyan)[m]"L"] = 1 ["mL"] $ <eq:uc-3>

= 組立単位とその意味

国際単位系を乗除算して表現したい単位を新たに作り出すことができる．この単位のことを*組立単位*という．各論的に次に述べる．

== 2乗，3乗のイメージ

乗算して作り出した単位としては，square meter $["m"^2]$，cubic meter $["m"^3]$が挙げられる．
meter [m]は一次元でありただの*直線*（@fig:R1）である．

#v(1.5em)

#figure(
  cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  // x軸とラベル
  line((-3, 0), (3, 0), mark: (end: "stealth"))
  content((3, 0), $x$, anchor: "west", padding: 0.2)
  // -2から2までの目盛りと数字の描画
  for x in range(-2, 3) {
    line((x, 0.2), (x, 0))
    content((x, 0), $#x$, anchor: "north", padding: 0.15)
  }
  // cyanの太い矢印
  line((0, 1), (2, 1), mark: (end: ">"), stroke: (paint: cyan, thickness: 1.5pt))
  // 破線
  line((0, 0), (0, 1), stroke: (dash: "dashed"))
  line((2, 0), (2, 1), stroke: (dash: "dashed"))
  }),
  caption: [一次元のイメージ]
) <fig:R1>

#v(1.5em)

　そこに[m]を掛けると二次元となり*平面*（@fig:R2）である．これは，*面積*と同じ意味を示している．

#figure(
  cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  // 長方形の描画 (cyan!30 の塗りつぶしとシアンの太線)
  // TikZの cyan!30 は「白で70%明るくする」ことに相当します
  rect((0, 0), (2, 3), 
    fill: cyan.lighten(70%), 
    stroke: (paint: cyan, thickness: 1.5pt)
  )
  // x軸とラベル
  line((0, 0), (4, 0), mark: (end: "stealth"))
  content((4, 0), $x$, anchor: "west", padding: 0.2)
  // x軸の目盛り (1から3まで)
  for x in range(1, 4) {
    line((x, 0.2), (x, 0))
    content((x, 0), $#x$, anchor: "north", padding: 0.15)
  }
  // y軸とラベル
  line((0, 0), (0, 4), mark: (end: "stealth"))
  content((0, 4), $y$, anchor: "south", padding: 0.2)
  // y軸の目盛り (0から3まで)
  for z in range(0, 4) {
    line((0.2, z), (0, z))
    content((0, z), $#z$, anchor: "east", padding: 0.15)
    }
  }),
  caption: [二次元のイメージ]
) <fig:R2>

#v(1.5em)

　さらに[m]を掛けると三次元となり*空間*（@fig:R3）である．これは，*体積*と同じ意味を示している．

#figure(
  cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  // 1. 前面 (cyan!30)
  // polygon ではなく line の close: true を使います
  line((0,0,1), (2,0,1), (2,3,1), (0,3,1), close: true, fill: cyan.lighten(70%), stroke: none)
  // 2. 右面 (cyan!30)
  line((2,0,1), (2,0,0), (2,3,0), (2,3,1), close: true, fill: cyan.lighten(70%), stroke: none)
  // 3. 底面 (cyan!40, 枠線あり)
  line((2,0,0), (2,0,1), (0,0,1), (0,0,0), close: true, 
  fill: cyan.lighten(60%), stroke: (paint: cyan, thickness: 1.5pt))
  // 4. 垂直の辺 (青線)
  line((2,0,0), (2,3,0), stroke: (paint: cyan, thickness: 1.5pt))
  line((2,0,1), (2,3,1), stroke: (paint: cyan, thickness: 1.5pt))
  line((0,0,1), (0,3,1), stroke: (paint: cyan, thickness: 1.5pt))
  line((0,0,0), (0,3,0), stroke: (paint: cyan, thickness: 1.5pt))
  // 5. 上面 (cyan!20, 枠線あり)
  line((2,3,0), (2,3,1), (0,3,1), (0,3,0), close: true, 
  fill: cyan.lighten(80%), stroke: (paint: cyan, thickness: 1.5pt))
  // 6. X軸と目盛り (右方向)
  line((0,0,0), (4,0,0), mark: (end: "stealth"))
  content((4,0,0), $x$, anchor: "west", padding: 0.2)
  for x in range(1, 4) {
    line((x, 0.2, 0), (x, 0, 0))
    content((x, 0, 0), $#x$, anchor: "north", padding: 0.15)
  }
  // 7. Z軸と目盛り
  line((0,0,0), (0,4,0), mark: (end: "stealth"))
  content((0,4,0), $z$, anchor: "south", padding: 0.2)
  for z in range(0, 4) {
    line((0.2, z, 0), (0, z, 0))
    content((0, z, 0), $#z$, anchor: "east", padding: 0.15)
  }
  // 8. Y軸と目盛り
  line((0,0,0), (0,0,4), mark: (end: "stealth"))
  content((0,0,4), $y$, anchor: "north", padding: 0.2) 
  for y in range(1, 4) {
    line((0.2, 0, y), (0, 0, y))
    content((0, 0, y), $#y$, anchor: "south-east", padding: 0.15) 
  }
  }),
  caption: [三次元のイメージ]
) <fig:R3>

== 単位の構成

単位＊＊#footnote[*大きさを1*に仕立てた＊＊のこと．]あたりの変化量は，分母に置くこと#footnote[一般に$[\/x]$や$[x^(-1)]$と表記されるが，本稿では分かりやすさより$1/x$を用いる．]で表現できる．
そのため，一例として @sec:convertion の @eq:uc-1 の単位は[hr/day]とも表記でき，[/day]は*1日あたり*という意味となる．

質量は，化学の計算においては*モル質量* [g/mol]の形で計算をする．
モル質量とは，#highlight(fill: yellow)[1 [mol]あたりの*質量*]のことである．各原子ごとに一義の値が経験則から計算されているため，その値を使えばよい．基本的には周期表に記載されている．日本化学会が公開している周期表を @fig:periodic に示した．

#figure(
  box(
    stroke: 1pt + blue,
    inset: 0pt,
    link("https://www.chemistry.or.jp/know/doc/atom_2026.pdf")[
      #image("atom_2026.pdf", page: 13, width: 75%)
    ]
  ),
  caption: [周期表 ],
) <fig:periodic>

== 戸惑いやすいが換算できる単位

ここから先の内容は，知っているか知らないかの2択である．そのため，簡単に表にまとめる程度にする．
まずは，一見では換算できなさそうであるが定義上同じものである．

#figure(
  table(
    columns: 6,
    align: (left, right, center, left, center, left),
    stroke: none,
    table.hline(stroke: 0.5pt),
    [体積と質量], [1 [cc]], [=], [1 [mL]], [=], [1 [g]#footnote[$4^degree"C"$の水基準である．それ以外では，値が前後することがあるので正確に量り取るときには適さない．]],
    [体積と密度], [1 [L]], [=], [$1 ["dm"^3]$], [=], [0.001 [$m^3$]],
    [モル濃度Molarity], [1 [M]], [=], [1 [mol/L]], [], [],
    [規定度Normality], [1 [N]], [=], [$1 ["M"] times "Eq."$], [=], [1 [N]#footnote[モル質量に価数Eq.を乗算したものである．価数は，化学式で表現したときの$"H"^+$または$"OH"^-$の数である．$"Eq." = 1$のとき，モル濃度と同じである．]],
    table.hline(stroke: 0.5pt),
  ),
  caption: [戸惑いやすいが換算できる単位],
) <tab:unit-1>

== molから換算できる単位

molを含んだ組立単位を @tab:unit-2 に示す．

#figure(
  table(
    columns: 4,
    align: (left, right, center, left),
    stroke: none,
    table.hline(stroke: 0.5pt),
    [物質量とアボガドロ定数], [1 [mol]], [=], [$6.022 times 10^(23)$ [個/mol]#footnote[アボガドロ定数の単位は，一般には「個」を省略して[/mol]を用いる．]],
    [物質量と気体の体積], [1 [mol]], [=], [22.4 [L/mol]],
    [物質量と液体の体積], [1 [mol]], [=], [$(n m) / rho$ [mL/mol]#footnote[$n$を物質量，$m$をモル質量，$rho$を密度とする．]],
    [物質量と固体の体積], [1 [mol]], [=], [$(n m) / rho$ [$"km"^3\/"mol"$]],
    table.hline(stroke: 0.5pt),
  ),
  caption: [molから換算できる単位],
) <tab:unit-2>

　モル質量は大きく3つある．原子量，分子量，式量である．
ただし，この3つは*無単位量*#footnote[これらは，相対質量として定められている．$attach("C", tl: 12) = 12$を基準として，*比の形*で他の原子量を表現する．そのため，単位が約分され無単位量として扱われる．正確な数値は，国際純正・応用化学連合IUPACによって承認されている．]として扱われているが，相対質量がモル質量と一致するので単位としては[g/mol]で良い．

#figure(
  table(
    columns: (auto, auto, auto),
    align: center,
    stroke: none,
    table.hline(stroke: 0.5pt),
    [Weight], [略称], [対象],
    table.hline(stroke: 0.5pt),
    [原子量Atomic Weight], [A.W.], [単一原子],
    [分子量Molecular Weight], [M.W.], [共有結合の分子],
    [式量Formula Weight], [F.W.], [イオン・塩などの化学式],
    table.hline(stroke: 0.5pt),
  ),
  caption: [原子量，分子量，式量],
) <tab:wt-1>

== 百分率は分母に100が隠れてる

ここからは，濃度の計算を扱う．試薬の調製において，特定のモル濃度や規定度に合わせるときに使う．
質量weight [g]と体積volume [mL]の違いの組み合わせで，大きく3つの濃度がある．

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: center,
    stroke: none,
    table.hline(stroke: 0.5pt),
    [Concentration], [単位], [意味], [単位換算用単位], [対象],
    table.hline(stroke: 0.5pt),
    [質量百分率], [(w/w)%], [溶液100 [g]中の溶質の[g]数], [[g/100g]], [粉末混合],
    [質量対体積百分率], [(w/v)%], [溶液100 [g]中の溶質の[mL]数], [[g/100mL]], [滴定],
    [体積百分率], [(v/v)%], [溶液100 [mL]中の溶質の[L]数], [[mL/100mL]], [溶媒混合],
    table.hline(stroke: 0.5pt),
  ),
  caption: [質量%濃度，質量/体積%濃度，体積%濃度],
) <tab:con-1>

　またよく使うものを，事前に高濃度で*ストック溶液stock solution*として用意されている．
これを*作業溶液working solution*にするためには，希釈dilutionして濃度を下げる操作を行う．

これは単純で，希釈前と希釈後の物質量が*変化しない*ということさえ押さえておけばよい．
モル [mol]はモル濃度 [mol/L]と体積 [L]の積で求められるので， @eq:dilution が成立する．

$ a ["mol/L"] times b ["L"] = x ["mol/L"] times y ["L"] $ <eq:dilution>

研究室には，ストック溶液用のレシピがあり，それをもとにストック溶液を調製することが多い．
その際に，調整したストック溶液のラベルにどれくらいの超純水に希釈すれば作業溶液になるのかを記載しておくとよい．
例えば，1 [L]中に100 [mL]のストック溶液を入れれば作業溶液になる場合は，ストック溶液のラベルに「1 ml/1L」と記載する．

これで本稿は以上とするが，このようにモル計算が基礎となって試薬が調製されていることを忘れないで欲しい．