---
layout: post
title: ImageJ protocol for sizing micropagules
author: Hannah Reich
date: 05/11/2021
tags: polyp bailout, ImageJ, photo analysis, synthetic coral, Putnam lab, NSF HDR
---

Date created: 20210511
Date last revised 20210528 HGR

# Image J protocol for sizing micropropagules

## Rationale: track micropropagule size to compare size differences (or lack thereof) between fragments, trials, and duration of trial.
## ImageJ will also be used to size secondary recruits (i.e., settled micropagules) and dinoflagellate symbiont cell size
## micropropagule phenotyping labnotebook post: https://github.com/hgreich/HGRlabnotebook/blob/master/_posts/20210120_micropropagule_phenotyping.Md

### **FREE software to download**
- [ImageJ](https://imagej.nih.gov/ij/docs/index.html). This is for image size analysis
- [Image_file_converter](https://imazing.com/heic). This is to convert .heic files to .jpg so they are readable by ImageJ. I (Hannah) use this because when I airdrop micropropagule images from iPhone8 to macbook pro they are dowloaded as .heic files. iMazing allows you to convert batches of images from .heic to .jpg AND keep the same file name (needs to include trial start date YYYYMMDD and fragmentID). Here is iMazing's instruction guide for the heic to jpg conversion https://imazing.com/guides/how-to-convert-heic-to-jpeg

### **Steps**
1. Open imageJ, open folder of photos
2. For **each** photo, go to *ANALYZE->SET SCALE* to create a measurement reference using the gridlines on the sedwig rafter cell in each picture. **NOTE:** Be sure to reset the measurement reference for each photo because most photos are taken with different smart phone magnification. the units are mm2. guide on iMageJ's website: https://imagej.net/SpatialCalibration
3. Once the reference is created, use the *FREEHAND* tool to draw around the micropropagule. The yellow line should outline the micropropagule as precisely as possible.
4. Record measurement (**control-M**), repeat steps 2-3 for each photo. save csv file and push to github.

### before measurement
![before_measurement](https://github.com/thesyntheticcoral/SynCoral_Protocols/blob/master/Polyp_Bailout/equipment_images/before_measurement.png)

### after measurement (the circumference of micropropagule is traced in yellow)
![after_measurement](https://github.com/thesyntheticcoral/SynCoral_Protocols/blob/master/Polyp_Bailout/equipment_images/after_measurement.png)
