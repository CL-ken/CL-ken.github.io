#import "@preview/rubber-article:0.1.0": *

#show: article.with(lang:"ja", text-size:11pt)
#set page("a4")

#set text(font: ("New Computer Modern", "Harano Aji Mincho"), weight: 450)
#show heading: set text(font: ("New Computer Modern Sans", "Harano Aji Gothic"), weight: 450)
#show strong: set text(font: ("New Computer Modern Sans", "Harano Aji Gothic"), weight: 300)
#set par(first-line-indent: 1em, spacing: 1em, leading: 1em)
#show heading: it => {
  v(2em, weak: true)
  it
  par(text(size: 0pt, ""))
  v(0.3em, weak: true)
}

#set columns(gutter: 2em)
#set par(
  first-line-indent: 1em,
  leading: 1em,
  spacing: 1em,
)

#maketitle(
  title: "物理学概論Ⅰ 参考資料",
  authors: (
    "ほうじ茶",
  ),
)

= はじめに

本資料は，定期試験のパターン化です．このまま丸暗記してもらって構いません．
なお，Typstを試して見たいだけなので詳細の解説はPhysics_overview1_reference.pdfをご確認ください．

= 水平投射（大問1）

まず，水平投射で考えることは以下である．
+ 初期条件を決める．
  - 初期地は，$bold(r)_0 = display(mat(x(0); y(0)))$ と記述できる．
    - ボールは最初，*$x$ 軸方向に 0 *のところにあるため，$x(0) = 0$ である．
    - ボールは最初，*$y$ 軸方向に $h$* のところにあるため，$y(0) = h$ である．
  - 初速度は， $bold(v)_0 = display(mat(dot(x)(0); dot(y)(0)))$ で記述できる．
    - ボールは最初，*$x$ 軸方向に $v_0$ で打ち出す*ため，$dot(x)(0) = v_0$ である．
    - ボールは*下に落ちるだけ*なので，$dot(y)(0) = 0$ である．
+ 加速度は，$display(bold(a) = mat(0; -g))$ と記述できる．
  - $x$ 軸方向は*等速直線運動*するため，加速度 $diaer(x)(t) = 0$ である． 
  - $y$ 軸方向は*自由落下*するため，加速度 $diaer(y)(t) = -g$ である．
+ 2. を運動方程式 $m diaer(bold(r)) = bold(F)$ にadaptする．
  - $m display(mat(diaer(x)(t); diaer(y)(t))) = m display(mat(0; -g))$ となる．
+ 3. で立てた運動方程式を解く．
  - $x$ 軸と$y$ 軸は，別々で計算をする．
+ $x$ 軸について運動方程式を解く．
  - $diaer(x)(t) = 0 t^0 = 0$ ($forall C_(n)(n in NN) in RR$)
  - $dot(x)(t) = 0 dot 1/1 t^(0+1) + C_1 t^(0) = C_1$
  - $x(t) = C_1 dot 1/1 t^(0+1) + C_2 t^(0) = C_1 t + C_2$

#colbreak()

+ $y$ 軸について運動方程式を解く．(詳細は，割愛する．5. を基に考えること．)
  - $diaer(y)(t) = -g t$ ($forall C_(n)(n in NN) in RR$)
  - $dot(y)(t) = -g t + C_3$
  - $y(t) = -1/2 g t^2 + C_3t + C_4$
+ 初期条件を任意定数に代入する．
  - $dot(x)(0) = v_0$ と $dot(x)(t) = C_1$ より，$C_1 = v_0$　である．
  - $x(0) = 0$ と $x(t) = v_0t + C_2$ より，$C_2 = 0$　である．
  - $dot(y)(0) = 0$ と $y(t) = C_3$ より，$C_3 = 0$　である．
  - $y(0) = h$ と $y(t) = -1/2 g t^2 + C_4$ より，$C_4 = h$　である．
+ $x$ 軸と $y$ 軸の情報をまとめる．
  - 加速度
  $
    mat(diaer(x)(t); diaer(y)(t)) = mat(0; -g t)
  $
  - 速度
  $
    mat(dot(x)(t); dot(y)(t)) = mat(v_0; -g t)
  $
  - 位置
  $
    mat(x(t); y(t)) = mat(v_0 t; -1/2 g t^2 + h)
  $

+ あとは，時間$t$ のパラメータを代入して求める．

= 最後に

Typstを試す資料なのでここまでにします．過去問の大問1はこれの*丸暗記*した方が圧倒的速く正確です．
地学概論の暗記もありますが，頑張ってください！

#align(right)[以上]