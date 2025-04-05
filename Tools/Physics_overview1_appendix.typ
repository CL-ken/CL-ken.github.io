#import "@preview/rubber-article:0.1.0": *

#show: article.with(lang:"ja", text-size:10pt)
#set page("a4")

#set text(font: ("New Computer Modern", "Harano Aji Mincho"), size: 11pt, weight: 450)
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
  title: "線形代数 学習ノート",
  authors: (
    "ほうじ茶",
  ),
)

#columns(
  2,
  gutter: 2em,
)[

= スカラーとベクトル

- スカラー（scalar）: 1つの大きさを持つ量．
  - 例）数直線
- ベクトル（vector）: 2つ以上の大きさを持つ量．
  - 例）直交座標系

== 幾何ベクトル

原点O，終点Aの有向線分を $upright(bold(O A))$ と表す．
点Aの座標を $(x, y)$ のすると，$display(upright(bold(O A))=mat(x;y))$ と表す．
このとき $upright(bold(O A))$ を*位置ベクトル*と呼ぶ．

$upright(bold(O A))$ を平行移動して $upright(bold(P Q))$ が得られるとき，
2つの有向線分は*同値*であるという．そのため，幾何ベクトルは*平行移動可能*であるといえる．

== 幾何ベクトルの演算
=== 加減法

ベクトル $bold(a)$, $bold(b)$ の演算を考える．$bold(a)$ 
その2つのベクトルを張る平行四辺形を作りその対角線が $upright(bold(A+B))$ 

== 座標系

+ 平面内に原点Oを定める．
+ 原点Oを始点とするベクトル$bold(e)_1$，$bold(e)_2$を定める．
  - このとき，$bold(e)_1 != bold(e)_2$ かつ $bold(e)_1 parallel.not bold(e)_2$ とする．
  - このベクトルのことを*基底ベクトル*と呼ぶ．
+ $bold(e)_1$，$bold(e)_2$をそれぞれ延長して，$bold(l)_1$，$bold(l)_2$を決める．
  - $bold(l)_1$，$bold(l)_2$のことを*座標軸*と呼ぶ．
+ 平面内に任意の点Pを定める．
+ 点Aの位置を $upright(bold(O A)) = x bold(e)_1 + y bold(e)_2$と表せる．
  - ($x$, $y$) を点Pの*座標*と呼ぶ．
  - (O, $bold(e)_1$, $bold(e)_2$) の組を*座標系*と呼ぶ．
  - 特に $bold(e)_1$と$bold(e)_2$ が直交しているとき，*直交座標系*と呼ぶ．

// 以下変更なし

]