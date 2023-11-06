use context essentials2021
#Definerer de forskjellige komponentene i et korsflagg
fun Nordic-flag(thin-horisontal, thin-vertical, thick-vertical, thick-horisontal, background):
  frame(
    overlay-xy(rectangle(400, 25, "solid", thin-horisontal), 0, -113,
      overlay-xy(rectangle(25, 250, "solid", thin-vertical), -137, 0,
        overlay-xy(rectangle(50, 250, "solid", thick-vertical), -125, 0,
          overlay-xy(rectangle(400, 50, "solid", thick-horisontal), 0, -100,
            rectangle(400, 250, "solid", background))))))
end

#Tegner flaggene med fargene knyttet opp til komponentene i flagget
Nordic-flag("blue", "blue", "white", "white", "red")
Nordic-flag("transparent", "transparent","white","white", "red")
Nordic-flag("transparent", "transparent", "yellow", "yellow", "blue")
Nordic-flag("transparent", "transparent", "darkblue", "darkblue", "white")
Nordic-flag("red", "red", "white", "white", "darkblue")
Nordic-flag("red", "red", "blue", "blue", "white")
