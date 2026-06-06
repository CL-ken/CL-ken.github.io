#import "@preview/cetz:0.4.2"
#set text(font: ("New Computer Modern", "Noto Serif JP"), weight: 450)
#show heading: set text(font: ("Inter 18pt", "Noto Sans JP"), weight: 450)
#show strong: set text(font: ("Inter 18pt", "Noto Sans JP"), weight: 300)
#set par(first-line-indent: 1em, spacing: 1em, leading: 0.8em)
#set heading(numbering: "1.")
#set par(leading: 1em)

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

#grid(
  columns: 3,
	gutter: 3em,
  figure(
  cetz.canvas(length: 0.28cm, {
  import cetz.draw: *
    // 方眼範囲
    line((-2, 22), (-2, -3.5), (16, -3.5), (16, 22), close: true, 
    fill: cyan.lighten(92%), stroke: cyan)
    // プロット範囲
    line((0, 20), (0, -3.5), (14, -3.5), (14, 20), close: true, 
    fill: black.lighten(92%), stroke: black)
    // 全体範囲
    rect((-4.5, 25), (18.5, -6.5), stroke: black)
    // グラフ軸 (逆向きの矢印)
    line((14, -3.5), (0, -3.5), mark: (start: "stealth"), stroke: 2pt)
    line((0, 20), (0, -3.5), mark: (start: "stealth"), stroke: 2pt)
    content((0, -3.5), text(magenta)[⑦ ] + [O], anchor: "north-east", padding: 0.1)
    content((15, -3), text(magenta)[④], anchor: "north")
    content((-0.5, 19.5), text(magenta)[④], anchor: "east")
    // グラフ
    line((0, -1), (8, 5), (8.5, 3), (14, 8), stroke: (paint: cyan, thickness: 1.5pt))
    line((0, 0), (14, 15), stroke: (paint: orange, thickness: 1.5pt, dash: "dashed"))
    // 点〇 (cyan)
    let pts-cyan = ((3, 1), (8.5, 3), (14, 7.5))
    for p in pts-cyan {
      circle(p, radius: 0.2, fill: cyan, stroke: none)
      circle(p, radius: 0.5, stroke: (paint: cyan, thickness: 1.5pt))
    }
    content((13.5, 8.5), text(magenta)[⑤], anchor: "south-east")
    content((8, 2), text(magenta)[⑩], anchor: "north-east")
    // 点◇ (Orange)
    circle((4, 5), radius: 0.2, fill: orange, stroke: none)
    content((3.8, 5.5), text(magenta)[⑥], anchor: "south-east")
    circle((9, 9), radius: 0.2, fill: orange, stroke: none)
    circle((12, 13), radius: 0.2, fill: orange, stroke: none)
    // 軸の名前
    content((7, -4), text(magenta)[③ ] + [*電圧* [V]], anchor: "north")
    content((7, 20.5), [図1　抵抗の電流電圧特性] + text(magenta)[①], anchor: "south")
    content((-0.5, 9), text(magenta)[② ] + [*電流* [mA]], anchor: "east")
    // 凡例
    content((2.5, 18), text(magenta)[⑧])
    }),
    caption: [間違ったグラフの例]
  ),
  figure(
    cetz.canvas(length: 0.28cm, {
    import cetz.draw: *
    // 方眼範囲
    line((-2, 22), (-2, -3.5), (16, -3.5), (16, 22), close: true, 
    fill: cyan.lighten(92%), stroke: cyan)
    // プロット範囲
    line((0, 20), (0, 0), (14, 0), (14, 20), close: true, 
    fill: black.lighten(92%), stroke: black)
    // 全体範囲
    rect((-4.5, 25), (18.5, -6.5), stroke: black)
    // グラフ軸
    line((14, 0), (0, 0), stroke: 2pt)
    line((0, 20), (0, 0), stroke: 2pt)
    content((0, 0), [O], anchor: "east", padding: 0.2)
    // x軸目盛り
    for x in (2, 8, 14) {
      line((x, 0), (x, 1), stroke: 2pt)
    }
    // y軸目盛り
    for y in (4, 8, 12, 16, 20) {
      line((0, y), (1, y), stroke: 2pt)
    }
    // グラフ
    line((0, 0), (14, 8), stroke: (paint: cyan, thickness: 1.5pt))
    line((0, 0), (14, 15), stroke: (paint: orange, thickness: 1.5pt, dash: "dashed"))
    // 点〇 (cyan)
    for p in ((3, 1), (8, 5), (13, 7.5)) {
      circle(p, radius: 0.2, fill: cyan, stroke: none)
      circle(p, radius: 0.5, stroke: (paint: cyan, thickness: 1.5pt))
    }
    // 点□ (Orange/Resistance 2)
    for p in ((4, 5), (9, 9), (12, 13)) {
      circle(p, radius: 0.2, fill: orange, stroke: none)
    // 四角形のマーカー
    rect((p.at(0) - 0.46, p.at(1) - 0.46), (p.at(0) + 0.46, p.at(1) + 0.46), 
    stroke: (paint: orange, thickness: 1.5pt))
    }
    // 軸の名前
    content((7, -0.2), [*電圧* [V]], anchor: "north", padding: 0.2)
    content((7, -2), [図2　抵抗の電流電圧特性], anchor: "north")
    content((0, 10), [*電流* [mA]], anchor: "south", angle: 90deg, padding: 0.5)
    // 凡例
    line((3, 18.5), (5, 18.5), stroke: (paint: cyan, thickness: 1.5pt))
    content((5, 18.5), [：*抵抗1*], anchor: "west")
    circle((4, 18.5), radius: 0.2, fill: cyan, stroke: none)
    circle((4, 18.5), radius: 0.5, stroke: (paint: cyan, thickness: 1.5pt))
    line((3, 17), (5, 17), stroke: (paint: orange, thickness: 1.5pt, dash: "dashed"))
    content((5, 17), [：*抵抗2*], anchor: "west")
    circle((4, 17), radius: 0.2, fill: orange, stroke: none)
    rect((4 - 0.46, 17 - 0.46), (4 + 0.46, 17 + 0.46), stroke: (paint: orange, thickness: 1.5pt))
    content((2, 17.75), text(size: 25pt)[{])
    }),
    caption: [正しいグラフの例]
  ),
)