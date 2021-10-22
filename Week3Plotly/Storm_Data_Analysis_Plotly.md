---
title: 'Developing Data Products - Most Harmful US Storm Events'
author: "Christine Grayson"
date: "10/22/2021"
output:
  html_document:
    df_print: paged
    self_contained: yes
    keep_md: yes
  pdf_document: default
---



## Synopsis

This project is created for week three of the peer graded assignment of the course "Developeing Data Products" offered by Johns Hopkins University through Coursera.

The aim is to produce a plotly graph. I thought I would repeat one of the graphs (produced in ggplot) from my submission for the course "Reproducible Research" which can be found [here](https://rpubs.com/graysonch/750089). The bar chart shows the most severe storms to personal safety. 








    


## Results

The following is a bar chart using a log scale for the y axis, this is to stop the top value from swamping everything else. In addition it has log color coding to make the extreme cases more visible. The bars are ordered by overall damage.  


```{=html}
<div id="htmlwidget-57b386a24d52959a98fc" style="width:900px;height:800px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-57b386a24d52959a98fc">{"x":{"data":[{"x":["AVALANCHE","BLIZZARD","COASTAL_FLOOD","COLD/WIND_CHILL","DEBRIS_FLOW","DENSE_FOG","DROUGHT","DUST_DEVIL","DUST_STORM","EXCESSIVE_HEAT","EXTREME_COLD/WIND_CHILL","FLASH_FLOOD","FLOOD","FREEZING_FOG","FROST/FREEZE","FUNNEL_CLOUD","HAIL","HEAT","HEAVY_RAIN","HEAVY_SNOW","HIGH_SURF","HIGH_WIND","HURRICANE_TYPHOON","ICE_STORM","LIGHTNING","MARINE_HIGH_WIND","MARINE_STRONG_WIND","MARINE_THUNDERSTORM_WIND","OTHER","RIP_CURRENT","SLEET","STORM_SURGE/TIDE","STRONG_WIND","THUNDERSTORM_WIND","TORNADO","TROPICAL_STORM","TSUNAMI","WATERSPOUT","WILDFIRE","WINTER_STORM","WINTER_WEATHER"],"y":[2.35218251811136,2.00432137378264,0.778151250383644,2.24797326636181,1.5910646070265,1.90308998699194,0.301029995663981,0.301029995663981,1.34242268082221,3.34222522936079,2.48429983934679,3.01703333929878,2.71180722904119,0.903089986991944,1.30102999566398,null,1.17609125905568,2.98989456371877,2.02530586526477,2.11058971029925,2.25285303097989,2.5092025223311,2.13033376849501,1.94939000664491,2.91222205653242,0,1.14612803567824,1,0.903089986991944,2.76117581315573,0.477121254719662,1.39794000867204,2.04532297878666,2.87448181769947,3.75073975123535,1.84509804001426,1.51851393987789,0.778151250383644,1.95424250943932,2.33645973384853,1.93951925261862],"marker":{"color":[2.35218251811136,2.00432137378264,0.778151250383644,2.24797326636181,1.5910646070265,1.90308998699194,0.301029995663981,0.301029995663981,1.34242268082221,3.34222522936079,2.48429983934679,3.01703333929878,2.71180722904119,0.903089986991944,1.30102999566398,null,1.17609125905568,2.98989456371877,2.02530586526477,2.11058971029925,2.25285303097989,2.5092025223311,2.13033376849501,1.94939000664491,2.91222205653242,0,1.14612803567824,1,0.903089986991944,2.76117581315573,0.477121254719662,1.39794000867204,2.04532297878666,2.87448181769947,3.75073975123535,1.84509804001426,1.51851393987789,0.778151250383644,1.95424250943932,2.33645973384853,1.93951925261862],"coloraxis":"coloraxis","line":{"color":"rgba(31,119,180,1)"}},"name":"FATALITIES","type":"bar","error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":["AVALANCHE","BLIZZARD","COASTAL_FLOOD","COLD/WIND_CHILL","DEBRIS_FLOW","DENSE_FOG","DROUGHT","DUST_DEVIL","DUST_STORM","EXCESSIVE_HEAT","EXTREME_COLD/WIND_CHILL","FLASH_FLOOD","FLOOD","FREEZING_FOG","FROST/FREEZE","FUNNEL_CLOUD","HAIL","HEAT","HEAVY_RAIN","HEAVY_SNOW","HIGH_SURF","HIGH_WIND","HURRICANE_TYPHOON","ICE_STORM","LIGHTNING","MARINE_HIGH_WIND","MARINE_STRONG_WIND","MARINE_THUNDERSTORM_WIND","OTHER","RIP_CURRENT","SLEET","STORM_SURGE/TIDE","STRONG_WIND","THUNDERSTORM_WIND","TORNADO","TROPICAL_STORM","TSUNAMI","WATERSPOUT","WILDFIRE","WINTER_STORM","WINTER_WEATHER"],"y":[2.23044892137827,2.90633504180509,0.903089986991944,1.77815125038364,1.72427586960079,3.03181227133037,0.602059991327962,1.63346845557959,2.64345267648619,3.85272391079121,2.41497334797082,3.25623653320592,3.83714634390906,2.33645973384853,1.98677173426624,0.477121254719662,3.13703745478951,3.32613095671079,2.45024910831936,3.01494034979294,2.41664050733828,3.19838213000829,3.12483014941386,3.29885307640971,3.71866773531621,0,1.34242268082221,1.41497334797082,1.04139268515823,2.72345567203519,0,1.63346845557959,2.47856649559384,3.97977593272969,4.96077510513009,2.5854607295085,2.11058971029925,1.85733249643127,3.20628604441243,3.13129779659762,2.9532763366673],"marker":{"color":[2.23044892137827,2.90633504180509,0.903089986991944,1.77815125038364,1.72427586960079,3.03181227133037,0.602059991327962,1.63346845557959,2.64345267648619,3.85272391079121,2.41497334797082,3.25623653320592,3.83714634390906,2.33645973384853,1.98677173426624,0.477121254719662,3.13703745478951,3.32613095671079,2.45024910831936,3.01494034979294,2.41664050733828,3.19838213000829,3.12483014941386,3.29885307640971,3.71866773531621,0,1.34242268082221,1.41497334797082,1.04139268515823,2.72345567203519,0,1.63346845557959,2.47856649559384,3.97977593272969,4.96077510513009,2.5854607295085,2.11058971029925,1.85733249643127,3.20628604441243,3.13129779659762,2.9532763366673],"coloraxis":"coloraxis","line":{"color":"rgba(255,127,14,1)"}},"name":"INJURIES","type":"bar","error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,1],"automargin":true,"title":"Event Types","zeroline":false,"type":"category","categoryorder":"array","categoryarray":["TORNADO","THUNDERSTORM_WIND","EXCESSIVE_HEAT","FLOOD","LIGHTNING","HEAT","ICE_STORM","FLASH_FLOOD","WILDFIRE","HIGH_WIND","HAIL","WINTER_STORM","HURRICANE_TYPHOON","DENSE_FOG","HEAVY_SNOW","WINTER_WEATHER","BLIZZARD","RIP_CURRENT","DUST_STORM","TROPICAL_STORM","STRONG_WIND","HEAVY_RAIN","HIGH_SURF","EXTREME_COLD/WIND_CHILL","FREEZING_FOG","AVALANCHE","TSUNAMI","FROST/FREEZE","WATERSPOUT","COLD/WIND_CHILL","DEBRIS_FLOW","DUST_DEVIL","STORM_SURGE/TIDE","MARINE_THUNDERSTORM_WIND","MARINE_STRONG_WIND","OTHER","COASTAL_FLOOD","DROUGHT","FUNNEL_CLOUD","MARINE_HIGH_WIND","SLEET"],"anchor":"y2","zerolinecolor":"#ffff","zerolinewidth":2,"tickangle":270,"gridcolor":"ffff"},"yaxis2":{"domain":[0,0.48],"automargin":true,"title":"INJURIES (LOG COUNT)","type":"log10","zeroline":false,"anchor":"x"},"yaxis":{"domain":[0.52,1],"automargin":true,"title":"FATALITIES (LOG COUNT)","type":"log10","zeroline":false,"anchor":"x","zerolinecolor":"#ffff","zerolinewidth":2,"gridcolor":"ffff"},"annotations":[],"shapes":[],"images":[],"width":900,"height":800,"margin":{"b":40,"l":60,"t":25,"r":10},"coloraxis":{"colorscale":"RdBu"},"hovermode":"closest","showlegend":false,"title":"Count of Fatalities and Injuries for Harmful Storm Events","plot_bgcolor":"#D3D3D3","font":{"family":"Arial","size":10,"color":"#000000"}},"attrs":{"1bb4c58b11825":{"x":{},"y":{},"marker":{"color":{},"coloraxis":"coloraxis"},"name":"FATALITIES","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"},"1bb4c75cf4504":{"x":{},"y":{},"marker":{"color":{},"coloraxis":"coloraxis"},"name":"INJURIES","alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"bar"}},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"subplot":true,"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```



  
  
  
