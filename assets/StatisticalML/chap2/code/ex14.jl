# This file was generated, do not modify it. # hide
using Joe: QDA
param1=QDA(μ= μ̂₁,Σ = Σ̂₁);param2=QDA(μ = μ̂₂,Σ = Σ̂₂)

hanbetsu(x,y) = param1(x,y) - param2(x,y)
x35=-5:0.1:5;y35=-5:0.1:5;
scatter(data1[:,1],data1[:,2])
scatter!( data2[:,1],data2[:,2])
p35_2=contour!(x35,y35, hanbetsu.(x35,y35'), title="QDA")
savefig(p35_2,joinpath(@OUTPUT,"fig2-4.svg")) # hide