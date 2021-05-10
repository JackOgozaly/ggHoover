# ggHoover

This is a joke package that was made as a gift and which replaces geom_point() in ggplot2 with custom images. This package was heavily based off the package "ggbernie" by R-CoderDotCom, so please check out their work if you're interested in learning more. 

Link: https://github.com/R-CoderDotCom/ggbernie


## Install Package

```
remotes::install_github("JackOgozaly/ggHoover")
library(ggHoover)
```


## Go Gators!

As you can see from the code below, we can edit which images appear on a graph by selecting Hoover="image_name_here"

```
ggplot(mtcars, aes(mpg,wt)) +
  geom_Hoover(Hoover = "gator")+ theme_bw()
```
![basic_gator](https://user-images.githubusercontent.com/72467438/117676915-fbe33f80-b17b-11eb-8331-a65692a36f1b.png)


## What Images Can I Choose?

| Image | Description |
| --- | --- |
| `anyone` | Picture of Ben Stein calling for Bueller |
| `accenture` | Accenture logo |
| `bam` | Double BAM!! from StatsQuest |
| `ferris` | Picture of Ferris Bueller singing in parade |
| `fighting_gator` | Picture of Albert Gator looking tough |
| `gator` | Florida gators logo |
| `statsquest` | Logo for StatsQuest |
| `UF` | Univeristy of Florida logo |

## Examples

### anyone
![ben_stein](https://user-images.githubusercontent.com/72467438/117676917-fbe33f80-b17b-11eb-91f3-99937eae8d3b.png)

### bam
![double_bam](https://user-images.githubusercontent.com/72467438/117676919-fbe33f80-b17b-11eb-807b-67a2baa11d28.png)

### ferris
![ferris](https://user-images.githubusercontent.com/72467438/117676921-fbe33f80-b17b-11eb-8825-1d74cf8deeb3.png)

### UF 
![UF](https://user-images.githubusercontent.com/72467438/117676922-fc7bd600-b17b-11eb-8e1b-347e6676538b.png)

### fighting_gator
![uf_v_ga](https://user-images.githubusercontent.com/72467438/117676923-fc7bd600-b17b-11eb-9e26-7d4f777c837e.png)

### accenture
![accenture](https://user-images.githubusercontent.com/72467438/117676914-fb4aa900-b17b-11eb-954e-c9db7e8b5ed7.png)
