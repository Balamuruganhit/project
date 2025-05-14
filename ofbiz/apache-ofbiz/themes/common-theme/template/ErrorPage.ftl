<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html>
<head>
    <meta http-equiv="Content-Security-Policy" frame-ancestors="self">
    <title>500 Internal error</title>
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Helvetica,Arial,sans-serif;
            color:#6d6e71;
            position:relative;
            background: #f6e9f0;
            margin:0;
            min-height:100vh;
            background: -moz-linear-gradient(-45deg, #f6e9f0 0%, #fdebeb 100%);
            background: -webkit-linear-gradient(-45deg, #f6e9f0 0%,#fdebeb 100%);
            background: linear-gradient(135deg, #f6e9f0 0%,#fdebeb 100%);
        }
        .container{
            position:relative;
            text-align:center;
        }
        .ofbiz{
            background: url(/rainbowstone/images/main.png) no-repeat left top / cover;
            margin: 10px auto;
            width: 4.2rem;
            height: 6.3rem;
        }
        .content{
            width:auto;
            max-width:1000px;
            margin-top:60px;
            border-radius:5px;
            background:#FFFFFF;
            padding:50px 100px 30px 100px;
            text-align:center;
            display: flex;
            flex-direction: column;
            position:relative;
            z-index:2;
            -webkit-box-shadow: 0px 0px 18px 0px rgba(159,32,100,0.11);
            -moz-box-shadow: 0px 0px 18px 0px rgba(159,32,100,0.11);
            box-shadow: 0px 0px 18px 0px rgba(159,32,100,0.11);
        }
        .content p.error-500{
            font-size:28px;
            letter-spacing:2px;
            font-weight:normal;
            color:#d22128;
        }
        .content p.error-500 span{
            display:block;
            letter-spacing:3px;
            color:#6d6e71;
            margin:0 0 10px 8px;
        }
        .content p.error-500 strong{
            font-size:150px;
            line-height:120px;
            font-weight:normal;
        }
        .content h1{
            font-size:28px;
            color:#6d6e71;
            letter-spacing:3px;
            font-weight:normal;
            text-transform: uppercase;
            margin:0 0 5px 0;
        }
        .content p{
            font-size:15px;
            text-align:justify;
            max-width:380px;
            margin:0 auto;
            line-height:20px;
        }
        .content .img{
            max-width:380px;
            margin:20px auto;
        }
        .top-right{
            position:absolute;
            top:0;
            right:0;
            z-index:0;
        }
        .bottom-left{
            position:absolute;
            bottom:0;
            left:0;
            z-index:0;
        }
    </style>
</head>
<body>
<div class="container">
        <div class="ofbiz">
        </div>
    <div class="content">
        <p class="error-500"><span>ERROR MESSAGE</span></p>
        <p>${(request.getAttribute("_ERROR_MESSAGE_")!)?replace("\n", "<br/>")}</p>
        <div class="img">
            <svg
                    xmlns:dc="http://purl.org/dc/elements/1.1/"
                    xmlns:cc="http://creativecommons.org/ns#"
                    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                    xmlns:svg="http://www.w3.org/2000/svg"
                    xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink"
                    id="svg3134"
                    version="1.1"
                    viewBox="0 0 101.20419 53.890289"
                    height="53.890289mm"
                    width="101.20419mm">
                <defs
                        id="defs3128">
                    <linearGradient
                            gradientTransform="translate(0,100)"
                            gradientUnits="userSpaceOnUse"
                            y2="4596.5923"
                            x2="3089.7664"
                            y1="4633.2754"
                            x1="3295.5352"
                            id="linearGradient2973"
                            xlink:href="#linearGradient2971" />
                    <linearGradient
                            id="linearGradient2971">
                        <stop
                                id="stop2967"
                                offset="0"
                                style="stop-color:#d23332;stop-opacity:1" />
                        <stop
                                id="stop2969"
                                offset="1"
                                style="stop-color:#a4205e;stop-opacity:1" />
                    </linearGradient>
                    <linearGradient
                            gradientTransform="translate(0,100)"
                            gradientUnits="userSpaceOnUse"
                            y2="4503.186"
                            x2="3037.604"
                            y1="4616.728"
                            x1="3071.7537"
                            id="linearGradient2981"
                            xlink:href="#linearGradient2979" />
                    <linearGradient
                            id="linearGradient2979">
                        <stop
                                id="stop2975"
                                offset="0"
                                style="stop-color:#8f2470;stop-opacity:1" />
                        <stop
                                id="stop2977"
                                offset="1"
                                style="stop-color:#282662;stop-opacity:1" />
                    </linearGradient>
                    <linearGradient
                            gradientTransform="translate(0,100)"
                            gradientUnits="userSpaceOnUse"
                            y2="4639.0312"
                            x2="3313.1592"
                            y1="4558.6782"
                            x1="3318.1951"
                            id="linearGradient2965"
                            xlink:href="#linearGradient2963" />
                    <linearGradient
                            id="linearGradient2963">
                        <stop
                                id="stop2959"
                                offset="0"
                                style="stop-color:#e97826;stop-opacity:1" />
                        <stop
                                id="stop2961"
                                offset="1"
                                style="stop-color:#d23232;stop-opacity:1" />
                    </linearGradient>
                    <linearGradient
                            gradientTransform="translate(0,100)"
                            gradientUnits="userSpaceOnUse"
                            y2="4579.4399"
                            x2="3380.7964"
                            y1="4518.3018"
                            x1="3410.6697"
                            id="linearGradient2957"
                            xlink:href="#linearGradient2955" />
                    <linearGradient
                            id="linearGradient2955">
                        <stop
                                id="stop2951"
                                offset="0"
                                style="stop-color:#f18c24;stop-opacity:1" />
                        <stop
                                id="stop2953"
                                offset="1"
                                style="stop-color:#f69923;stop-opacity:1" />
                    </linearGradient>
                </defs>
                <metadata
                        id="metadata3131">
                    <rdf:RDF>
                        <cc:Work
                                rdf:about="">
                            <dc:format>image/svg+xml</dc:format>
                            <dc:type
                                    rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
                            <dc:title></dc:title>
                        </cc:Work>
                    </rdf:RDF>
                </metadata>
                <g
                        transform="translate(-50.000687,-91.563468)"
                        id="layer1">
                    <ellipse
                            style="opacity:0.93999999;vector-effect:none;fill:#e0e0e2;fill-opacity:1;stroke:none;stroke-width:5.88446999;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers stroke fill"
                            id="path2338"
                            cx="100.09739"
                            cy="144.49492"
                            rx="45.061985"
                            ry="0.95883906" />
                    <g
                            id="g3007"
                            transform="matrix(0.26458333,0,0,0.26458333,-752.54101,-1126.3783)">
                        <path
                                id="path2949"
                                d="m 3099.611,4677.0045 -24.8738,0.9885 -1.0458,47.8527 c 17.4472,29.1352 46.7055,35.8466 49.6055,36.2871 l 0.416,-0.027 c 0.8342,-0.057 44.8931,7.0033 97.6738,6.7656 1.9239,0.032 3.8829,0.02 5.8672,0.019 10.4557,-0.2921 20.9114,-0.5846 31.7559,-1.3222 l 8.7597,-0.5957 c 44.0415,-4.5557 71.6919,-13.8526 91.0043,-28.8876 l -66.3278,-34.0236 -2.8629,-10.3876 c 0,0 -2.1891,-9.2804 -1.315,-13.6891 0.045,-0.2266 -2.5622,2.646 -2.7241,2.8105 -1.0324,1.0494 -2.0704,2.0877 -3.1133,3.115 -3.3439,3.294 -9.724,13.7141 -9.5894,22.6578 -2.1794,-2.3452 -2.7698,-9.6496 -2.0263,-12.2214 -8.9877,7.4803 -8.3721,17.754 -8.3721,17.754 0,0 -3.2886,-4.6275 -0.6156,-10.2737 -5.2288,4.2463 -15.2051,12.9052 -20.2609,16.7394 -2.0003,1.3931 -4.3883,3.2319 -6.3887,4.625 -27.2409,1.5348 -76.3408,-16.6686 -110.0742,-31.5723 0,-0.017 0,-0.03 -0.01,-0.047 -11.1338,-5.286 -20.3674,-12.2405 -24.4059,-16.8766 z"
                                style="fill:url(#linearGradient2973);fill-opacity:1;stroke-width:4.18057013" />
                        <path
                                id="path2939"
                                d="m 3039.457,4603.2461 c -1.7156,-0.059 -2.998,1.5601 -2.5488,3.2168 5.5069,21.5006 14.2349,40.2926 28.5684,57.5293 -1.8764,1.2006 -4.0328,1.7834 -6.502,-0.9375 -3.888,2.8901 -10.2147,3.4406 -17.0703,3.4785 5.618,2.6754 11.9512,3.2385 18.2656,1.127 -11.3013,18.5428 -15.5045,37.5612 -6.248,53.6699 0.8272,1.4378 1.7484,2.8489 2.7832,4.2265 -2.7685,-6.5328 -2.2158,-12.4448 3.2168,-21.1464 -1.3503,16.4797 0.6898,26.243 6.8847,37.2753 1.4655,2.6134 3.1699,5.3116 5.1172,8.1739 -3.1637,-10.3608 -3.1933,-19.7935 -0.7109,-28.3535 0.7854,1.5191 1.6331,2.9281 2.4785,4.3398 l 4.2109,-46.1543 23.6387,-2.1465 c -0.8815,-1.012 -1.8085,-2.0436 -2.2285,-2.8808 -0.2789,-0.1851 -0.5445,-0.3643 -0.8301,-0.5371 8.8323,-0.4897 21.3072,-7.9531 21.2207,-7.9688 -15.7359,1.5956 -30.3497,1.3516 -41.9511,-3.8828 1.4513,-4.6892 5.878,-9.7728 11.9941,-15.1016 -10.2162,3.4402 -14.8524,7.694 -16.4453,9.4668 3.1124,-6.6149 2.3826,-15.6739 1.0097,-25.1504 -1.3467,11.5951 -3.9832,20.1778 -8.1269,25.2305 -11.9354,-15.4968 -19.398,-32.2516 -24.334,-51.5234 -0.2687,-1.114 -1.2473,-1.9121 -2.3926,-1.9512 z"
                                style="fill:url(#linearGradient2981);fill-opacity:1;stroke-width:4.18057013" />
                        <path
                                id="path2936"
                                d="m 3291.9932,4703.2276 13.663,41.8837 52.2442,-6.3711 c 14.7463,-11.4801 25.148,-26.6816 35.5156,-46.6738 1.2296,-2.3164 2.4489,-4.8154 3.5895,-7.0422 l -44.626,5.588 -18.3374,-58.9756 c -13.2982,10.3972 -24.4369,23.3098 -31.589,32.1993 -5.1853,6.574 -9.573,24.8439 -10.4599,39.3917 z"
                                style="fill:url(#linearGradient2965);fill-opacity:1;stroke-width:4.18057013" />
                        <path
                                id="path22-4"
                                d="m 3333.8105,4631.791 18.4532,59.0528 44.5488,-5.4336 c 18.6958,-36.5015 25.347,-61.0535 11.6523,-70.7852 -20.7097,-14.9333 -50.1324,1.9932 -62.248,8.6836 -4.3339,2.4988 -8.4633,5.3997 -12.4063,8.4824 z"
                                style="fill:url(#linearGradient2957);fill-opacity:1;stroke-width:4.18057013" />
                        <path
                                id="path22-4-6-0-9"
                                d="m 3364.2109,4664.6016 c -0.2907,1.1205 -3.7885,7.2979 -7.9199,16.5254 -4.1314,9.2274 -10.8379,21.2782 -21.3555,33.4414 -21.0267,24.3165 -57.1996,49.168 -119.1406,52.9843 -14.5823,0.1568 -29.7998,0.1712 -42.7884,-0.1998 l 1.2787,4.653 c 13.0252,0.3721 26.9095,0.6885 41.6171,0.5293 h 0.062 0.062 c 63.1986,-3.8754 100.8825,-29.5001 122.6758,-54.7031 10.8967,-12.6016 15.8356,-24.4605 20.1276,-34.0465 4.292,-9.586 5.9952,-17.1273 6.2025,-17.9262 z"
                                style="color:#000000;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:medium;line-height:normal;font-family:sans-serif;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-feature-settings:normal;text-indent:0;text-align:start;text-decoration:none;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:#000000;letter-spacing:normal;word-spacing:normal;text-transform:none;writing-mode:lr-tb;direction:ltr;text-orientation:mixed;dominant-baseline:auto;baseline-shift:baseline;text-anchor:start;white-space:normal;shape-padding:0;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:4.98099995;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate" />
                        <path
                                id="path22-4-6-2"
                                d="m 3033.2285,4604.5879 c 6.1937,27.3012 16.9356,50.23 36.9317,71.0605 20.4864,25.5095 51.8053,52.0069 98.4281,74.601 3.9716,0.5927 3.8864,-0.1719 8.2281,-1.7435 -49.3956,-22.9249 -81.8746,-50.1342 -102.707,-76.086 l -0.072,-0.088 -0.08,-0.084 c -19.4679,-20.231 -29.8067,-42.2228 -35.818,-69 z"
                                style="color:#000000;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:medium;line-height:normal;font-family:sans-serif;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-feature-settings:normal;text-indent:0;text-align:start;text-decoration:none;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:#000000;letter-spacing:normal;word-spacing:normal;text-transform:none;writing-mode:lr-tb;direction:ltr;text-orientation:mixed;dominant-baseline:auto;baseline-shift:baseline;text-anchor:start;white-space:normal;shape-padding:0;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:#fffffb;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:5.10127163;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate" />
                        <g
                                style="fill:#ffffff"
                                id="g24-3-7-5"
                                transform="matrix(4.1709335,-0.28368989,0.28368989,4.1709335,3011.7193,4498.5132)">
                            <path
                                    style="fill:none;stroke:#fffffc;stroke-width:1.06773412;stroke-opacity:1"
                                    id="path22-4-6-0"
                                    d="m 49.402494,57.232911 c -4.630827,2.873375 -14.382842,6.210532 -23.858254,7.141741 -1.934467,0.190113 -3.858435,0.283733 -5.726392,0.257987 l 0.108333,2.12e-4 v 0 0 0 0 0" />
                        </g>
                    </g>
                </g>
            </svg>
        </div>
    </div>
    
</div>
<div class="top-right">
    <svg
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:cc="http://creativecommons.org/ns#"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:svg="http://www.w3.org/2000/svg"
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="svg4630"
            version="1.1"
            viewBox="0 0 103.89402 172.09494"
            height="172.09494mm"
            width="103.89402mm">
        <defs
                id="defs4624">
            <linearGradient
                    gradientTransform="matrix(-0.26458333,0,0,-0.26458333,839.39308,1318.2247)"
                    gradientUnits="userSpaceOnUse"
                    y2="4933.9526"
                    x2="2718.0952"
                    y1="4404.6724"
                    x1="2390.8035"
                    id="linearGradient2470"
                    xlink:href="#linearGradient2963" />
            <linearGradient
                    id="linearGradient2963">
                <stop
                        id="stop2959"
                        offset="0"
                        style="stop-color:#e97826;stop-opacity:1" />
                <stop
                        id="stop2961"
                        offset="1"
                        style="stop-color:#d23232;stop-opacity:1" />
            </linearGradient>
        </defs>
        <metadata
                id="metadata4627">
            <rdf:RDF>
                <cc:Work
                        rdf:about="">
                    <dc:format>image/svg+xml</dc:format>
                    <dc:type
                            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
                    <dc:title></dc:title>
                </cc:Work>
            </rdf:RDF>
        </metadata>
        <g
                transform="translate(-106.49747,0.6493372)"
                id="layer1">
            <path
                    style="opacity:0.08900003;fill:url(#linearGradient2470);fill-opacity:1;stroke:none;stroke-width:0.26458332px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
                    d="m 106.49938,-0.6493372 103.65044,0.06699 c 0,0 0.24167,137.8763572 0.24167,172.0279572 C 194.14658,86.301976 106.02462,100.09249 106.49938,-0.6493372 Z"
                    id="path2462" />
        </g>
    </svg>
</div>
<div class="bottom-left">
    <svg
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:cc="http://creativecommons.org/ns#"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:svg="http://www.w3.org/2000/svg"
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="svg4033"
            version="1.1"
            viewBox="0 0 91.812927 146.7365"
            height="146.7365mm"
            width="91.812927mm">
        <defs
                id="defs4027">
            <linearGradient
                    gradientTransform="matrix(-0.26458333,0,0,-0.26458333,916.99951,1314.7743)"
                    gradientUnits="userSpaceOnUse"
                    y2="4298.6235"
                    x2="3464.0454"
                    y1="3842.3198"
                    x1="3123.0879"
                    id="linearGradient2460"
                    xlink:href="#linearGradient2979" />
            <linearGradient
                    id="linearGradient2979">
                <stop
                        id="stop2975"
                        offset="0"
                        style="stop-color:#8f2470;stop-opacity:1" />
                <stop
                        id="stop2977"
                        offset="1"
                        style="stop-color:#282662;stop-opacity:1" />
            </linearGradient>
        </defs>
        <metadata
                id="metadata4030">
            <rdf:RDF>
                <cc:Work
                        rdf:about="">
                    <dc:format>image/svg+xml</dc:format>
                    <dc:type
                            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
                    <dc:title></dc:title>
                </cc:Work>
            </rdf:RDF>
        </metadata>
        <g      transform="translate(0.7040734,-151.73208)"
                id="layer1">
            <path   style="opacity:0.125;fill:url(#linearGradient2460);fill-opacity:1;stroke:none;stroke-width:0.26458332px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
                    d="M -0.7040734,298.46858 V 151.73208 C 31.56287,239.33445 96.998351,202.92977 90.682481,298.16045 Z"
                    id="path2452" />
        </g>
    </svg>
</div>
</body></html>