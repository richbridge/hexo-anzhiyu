---
title: 朋友圈
date: 2020-01-01
comments: true
aside: true
top_img: false
type: "fcircle"
---

<div id="friend-circle-lite-root"></div>
<script>
    if (typeof UserConfig === 'undefined') {
        var UserConfig = {
            // 填写你的fc Lite地址
            private_api_url: 'https://fc.liushen.fun/',
            // 点击加载更多时，一次最多加载几篇文章，默认20
            page_turning_number: 24,
            // 头像加载失败时，默认头像地址
            error_img: 'https://pic.imgdb.cn/item/6695daa4d9c307b7e953ee3d.jpg',
        }
    }
</script>
<link rel="stylesheet" href="https://fastly.jsdelivr.net/gh/willow-god/Friend-Circle-Lite/main/fclite.min.css">
<script src="https://fastly.jsdelivr.net/gh/willow-god/Friend-Circle-Lite/main/fclite.min.js"></script>
