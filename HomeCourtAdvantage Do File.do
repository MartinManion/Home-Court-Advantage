sum
tab conf
tab otper
gen lattend = log(attend)
gen lmiles = log(miles)
gen visftc = visft*100
reg visftc lattend lmiles allstar numgame otper conf
predict yhatreset, xb
gen yhatreset2 = yhatreset^2
gen yhatreset3 = yhatreset^3
reg visftc lattend lmiles allstar numgame otper conf yhatreset2 yhatreset3
test yhatreset2 = yhatreset3 = 0
reg visftc lattend lmiles allstar numgame otper conf
predict uhatwbp, resid
gen uhatwbp2 = uhatwbp^2
reg uhatwbp2 yhatreset yhatreset2
reg uhatwbp2 lattend lmiles allstar numgame otper conf
corr lattend lmiles allstar numgame otper conf
tab uhatwbp
sum uhatwbp
reg visftc lattend allstar otper
reg visftc lattend allstar otper, robust