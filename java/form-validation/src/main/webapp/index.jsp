<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>index</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="GnohiSiaM,hellomonday">
        <meta http-equiv="description" content="you are my girl">
        <meta name="author" content="hello_monday">
        <link rel="Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="static/image/apple.ico" type="image/x-icon">
        <script src="static/js/jquery-1.10.2.min.js"></script>
        <link rel="stylesheet" href="static/css/sidebar.css" type="text/css"/>
        <link rel="stylesheet" href="static/css/topbar.css" type="text/css"/>
        <link rel="stylesheet" href="static/css/footer.css" type="text/css"/>
        <link rel="stylesheet" href="static/css/rocket.css" type="text/css"/>
        <link rel="stylesheet" href="static/css/greybox.css" type="text/css"/>
        <style type="text/css">
            * {
                margin:0;
                padding:0;
            }
            .mybox {
                position: relative;
                background: #FFF;
                max-width: 820px;
                margin: 56px auto 16px 270px;
                padding: 20px;
                border-radius: 9px;
                -webkit-box-shadow: 0px 0px 6px rgba(32, 32, 32, 0.6);
                -moz-box-shadow: 0px 0px 6px rgba(32, 32, 32, 0.6);
                -o-box-shadow: 0px 0px 6px rgba(32, 32, 32, 0.6);
                -ms-box-shadow: 0px 0px 6px rgba(32, 32, 32, 0.6);
                box-shadow: 0px 0px 6px rgba(32, 32, 32, 0.6);
            }
            p {
                word-break: break-all;
                word-wrap: break-word;    /* 这两行可保证网页不会被撑开 */
                text-indent: 23px;
                margin-top: 23px;
                padding: 5px 10px;
                -webkit-transition: -webkit-box-shadow 1s;
                -moz-transition: -moz-box-shadow 1s;
                -o-transition: -o-box-shadow 1s;
                transition: box-shadow 1s;
            }
            p:hover {
                border-radius: 3px;
                border-bottom: 1px solid transparent;
                background: #f0f0f0 url(static/image/bg.png);
                -webkit-box-shadow: inset 0px 0px 9px rgba(32, 32, 32, 0.6);
                -moz-box-shadow: inset 0px 0px 9px rgba(32, 32, 32, 0.6);
                -o-box-shadow: inset 0px 0px 9px rgba(32, 32, 32, 0.6);
                -ms-box-shadow: inset 0px 0px 9px rgba(32, 32, 32, 0.6);
                box-shadow: inset 0px 0px 9px rgba(32, 32, 32, 0.6);
            }
            #topbox {
                width: 100%;
                height: 120px;
                overflow: hidden;
                background: rgba(0, 0, 0, 0.7);
            }
            @font-face {
                font-family: 'komika_axisregular';
                src: url('static/font/komikax_-webfont.eot');
                src: url('static/font/komikax_-webfont.eot?#iefix') format('embedded-opentype'),
                     url('static/font/komikax_-webfont.woff') format('woff'),
                     url('static/font/komikax_-webfont.ttf') format('truetype'),
                     url('static/font/komikax_-webfont.svg#komika_axisregular') format('svg');
                font-weight: normal;
                font-style: normal;
            }
            .GnohiSiaM {
                margin-right: 180px;
                position: relative;
                float: right;
                display: table;
                text-decoration: none;
                font-size: 66px;
                font-family: komika_axisregular;
                font-variant: small-caps;
                text-shadow: 2px 5px 12px rgba(32, 32, 32, 1);
                color: whitesmoke;
            }
            .GnohiSiaM b {
                color: firebrick;
            }
            /*当屏幕尺寸小于1250px时，应用下面的CSS样式*/
            @media screen and (max-width: 1250px) {
                .mybox {
                    margin: 60px auto 30px 180px;
                    width: auto;
                }
                .topbar, .sidebar_fixed, .sidebar {
                    left: 10px;
                }
            }
            /*当屏幕尺寸小于800px时，应用下面的CSS样式*/
            @media screen and (max-width:800px) {
                .mybox {
                    margin: 60px auto 30px;
                }
                #topbox, #footer, .sidebar_fixed, .sidebar {
                    display: none;
                }
                .wrap_topbar {
                    position: fixed;
                    top: 0;
                }
                .wrap_topbar, .wrap_topbar_fixed {
                    height: 0;
                }
            }
        </style>
    </head>
    <body style="background:#f0f0f0 url(static/image/bg.png); font-family:Microsoft Yahei;">

        <!-- ***********顶部logo什么的***********  -->
        <div id="topbox">
            <a href="index.jsp" class="GnohiSiaM">GnohiS<b>iaM</b></a>
        </div>

        <!-- ***********顶栏***********  -->
        <div id="wrap_topbar" class="wrap_topbar">
            <div class="topbar">
                <a href="index.jsp" title="GnohiSiaM" class="site">GnohiS<b>iaM</b></a>
                <ul class="main_nav">
                    <li><a href="#" class="active">首页</a></li>
                    <li><a href="formValidation.jsp">注册(JS)</a></li>
                    <li><a href="testHTML5.jsp">注册(HTML5)</a></li>
                    <li><a href="404.jsp">404页面</a></li>
                    <li><a href="agreement.jsp">协议</a></li>
                    <li><a href="banner.jsp">海报墙</a></li>
                    <li><a href="login.jsp">登陆</a></li>
                </ul>
            </div>
        </div>

        <!-- ***********侧边栏********** -->
        <aside id="sidebar" class="sidebar">
            <header>
                <a href="index.jsp" rel="home">
                    <img class="logo" src="static/image/inter.jpg" alt="logo">
                </a>
                <span class="slogan">请对我残酷些<br>-= <strong style="color:black;">${name}</strong> =-<br>他朝我走得坚壮些</span>
            </header>
            <section>
                <ul class="quick_nav">
                    <li><a href="404.jsp">Java编程思想</a></li>
                    <li><a href="404.jsp">数据与计算机通信</a></li>
                    <li><a href="404.jsp">现代操作系统</a></li>
                    <li><a href="formValidation.jsp" target="_blank">formValidation</a></li>
                    <li><a href="testHTML5.jsp">testHTML5</a></li>
                    <li><a href="agreement.jsp">agreement</a></li>
                    <li><a href="banner.jsp">banner</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </section>
        </aside>

        <!-- ***********控制侧边栏及顶栏的位置*********** -->
        <script>
            $(function() {    //$(document).ready()的简写
                $(window).scroll(function() {
                    if ($(window).scrollTop() > 120) {
                        $('#wrap_topbar').addClass('wrap_topbar_fixed');
                        $('#sidebar').addClass('sidebar_fixed');
                    } else {
                        $('#wrap_topbar').removeClass('wrap_topbar_fixed');
                        $('#sidebar').removeClass('sidebar_fixed');
                    }
                })
            });
            /*-------原生JS的实现---------
            var wrap_topbar = document.getElementById('wrap_topbar');
            var sidebar = document.getElementById('sidebar');
            window.onscroll = function() {
                if (document.body.scrollTop > 120) {
                    wrap_topbar.className = 'wrap_topbar wrap_topbar_fixed';
                    sidebar.className = 'sidebar sidebar_fixed';
                } else {
                    wrap_topbar.className = 'wrap_topbar';
                    sidebar.className = 'sidebar';
                }
            } ------------------------*/
        </script>

        <!-- *********判断是否已登录********* -->
        <script>
            $(function() {    //$(document).ready()的简写
                if ('${name}' != '') {
                    $('[href="login.jsp"]').text('退出').attr('href','LogoutServlet');
                }
            });
        </script>

        <!-- ***********主体内容*********** -->
        <div class="mybox">
            <div class="greybox">
                <h1 style="text-align:center; color:#88A9FF; letter-spacing:6px;">
                    如何练习一万小时？
                </h1>
            </div>
            <p>
                随着畅销书《异类》的流行，“练习一万小时成天才” 这个口号现在是尽人皆知。也许仍然有不少人相信那些不世出的天才必有天生的神秘能力，但科学家通过大量的调查研究已经达成共识，那就是所有顶级高手都是练出来的。不但如此，最近几年的科学进展，人们可能第一次拥有了一个关于怎样炼成天才的统一理论。
            <p>
                好消息是除了某些体育项目对天生的身高和体型有特殊要求之外，神秘的天生素质并不存在，也就是说人人都有可能成为顶级高手。早在 20 多年以前，芝加哥大学的教育学家 Benjamin Bloom 就曾经深入考察过 120 名从音乐到数学多个领域内的精英人物，发现他们幼年时代没有任何特别之处。后人的研究更证明，在多个领域内，就连智商都跟一个人能不能达到专家水平没关系。
            </p>
            <p>
                有个匈牙利心理学家很早就相信只要方法得当，任何一个人都可以被训练成任何一个领域内的高手。为了证明这一点，他选择了一个传统上女性不擅长的项目，也就是国际象棋。结果他和妻子把自己的三个女儿都训练成了国际象棋世界大师，这就是著名的波尔加三姐妹。这个实验甚至证明哪怕你不爱好这个领域，也能被训练成这个领域的大师，因为三姐妹中的一个并不怎么喜欢国际象棋。
            </p>
            <p>
                而坏消息是成为大师需要长时间的苦练。每天练三小时，完成一万小时需要十年时间，但这只是达到世界水平的最低要求。统计表明对音乐家而言，世界级水平要求的训练时间是十五到二十五年。但最关键的并不是练习的时间，而是练习的方法。
            </p>
            <p>
                天才是怎样炼成的？中国传统思维比较强调一个 “苦” 字，冬练三九夏练三伏，甚至是头悬梁锥刺股。而近代生活条件越来越好，人们则开始强调一个 “爱” 字，说兴趣是最好的老师，强调寓教于乐，“哈佛女孩” 的家长们纷纷写书，介绍自己的孩子如何一路玩进名校。
            </p>
            <p>
                很多励志故事和流行的成功学书籍最爱强调的似乎是 “顿悟”，认为一个人之所以不成功是因为他没想通，他没有认识到真正的自己！好像一旦一个人顿悟到了真正的自己，他就会非常简单地在本来应该属于自己的领域成为天才人物。一个销售员可能认为真正的自己其实是个小说家，一个医生可能认为真正的自己其实是个画家 — 唯一的问题是他们从来没有写过小说或者画过画 — 但他们认为他们距离 “真正的自己” 只有一步之遥，一旦尝试了就会爆发天才。
            </p>
            <p>
                所有这些关于成功学的个人经验和励志故事都不科学。假设一个成功人士做过一百件事，包括参加演讲比赛，衣着有个性，听英文歌曲，最喜欢的颜色是绿色等等，他会非常自得地把这一百件事都写进自传，没准还要加上女朋友的影响。然而其中真正起到决定性作用的可能只有四件事，问题是他和读者都不知道是哪四件。
            </p>
            <p>
                科学家不信励志故事，他们只相信调查研究。在过去二三十年内，心理学家们系统地调研了各行各业内的从新手，一般专家到世界级大师们的训练方法，包括运动员，音乐家，国际象棋棋手，医生，数学家，有超强记忆力者等等，试图发现其中的共性。他们的研究甚至细致到精确记录一所音乐学院的所有学生每天干的每一件小事，用多少时间做每件事，父母和家庭环境，来比较到底是什么使得那些音乐天才脱颖而出。
            </p>
            <p>
                现在这项工作已经成熟了。2006 年，一本 900 多页的书，The Cambridge Handbook of Expertise and Expert Performance， 出版。这是 “怎样炼成天才” 研究的一本里程碑式的学术著作，此书直接引领了后来一系列畅销书的出现，包括格拉德威尔的《异类》，Geoff Colvin 的 Talent is Overrated，和 Daniel Coyle 的 The Talent Code 等等。科学家们不但证明了高手是练出来的，而且通过考察各个领域最好的训练方法的共性，总结了一套统一的练习方法，这就是所谓 “刻意练习”（deliberate practice）。
            </p>
            <p>
                过去多年来，训练方法是不断进步的。比如说作曲，假设一名普通学生使用普通训练方法六年时间能达到的水平，另一个学生使用新的训练方法三年就能达到，那么我们可以说这个新训练方法的 “有效指数” 是 200%。统计表明，莫扎特当时的训练，他的有效指数是 130%。而二十世纪的天才也许没有莫扎特有名，但其训练水平都能达到 300% 到 500%！十三世纪的哲学家培根曾经认为任何人都不可能在少于 30 年之内掌握数学，而现在的学生十几岁的时候已经学到多得多的数学，教学方法进步了。事实上，我们今天在所有领域都比过去做得更好，体育世界纪录被不断打破，艺术家们的技巧也是过去根本无法想象的。
            </p>
            <p>
                训练方法重要性的另一个体现是 “天才” 的扎堆出现，比如曾经有一个时期俄罗斯对女子网球，韩国对女子曲棍球，更不必说中国对乒乓球的的绝对优势。更进一步，哪怕你这个国家传统上并不擅长这个项目，只要有一名教练摸索掌握了科学训练法，那么他就可以带出一代绝世高手，比如中国花样滑冰教练姚滨。人们经常感慨中国十多亿人居然找不到 11 个足球天才 — 如果天才是天生的，那么十多亿人必然足以产生很多天才，但天才是练出来的，而中国缺乏有效的练习环境，人口再多也比不上欧洲小国。
            </p>

            <br/><h2>刻意练习</h2>

            <p>
                首次提出 “刻意练习” 这个概念的是佛罗里达大学心理学家 K. Anders Ericsson。这套练习方法的核心假设是，专家级水平是逐渐地练出来的，而有效进步的关键在于找到一系列的小任务让受训者按顺序完成。这些小任务必须是受训者正好不会做，但是又正好可以学习掌握的。完成这种练习要求受训者思想高度集中，这就与那些例行公事或者带娱乐色彩的练习完全不同。“刻意练习” 的理论目前已经被广泛接受，我们可以总结一下它的特点。
            </p>

            <br/><h3>1. 只在 “学习区” 练习</h3>

            <p>
                科学家们考察花样滑冰运动员的训练，发现在同样的练习时间内，普通的运动员更喜欢练自己早已掌握了的动作，而顶尖运动员则更多地练习各种高难度的跳。普通爱好者打高尔夫球纯粹是为了享受打球的过程，而职业运动员则集中练习在各种极端不舒服的位置打不好打的球。真正的练习不是为了完成运动量，练习的精髓是要持续地做自己做不好的事。
            </p>
            <p>
                心理学家把人的知识和技能分为层层嵌套的三个圆形区域：最内一层是 “舒适区”，是我们已经熟练掌握的各种技能；最外一层是 “恐慌区”，是我们暂时无法学会的技能，二者中间则是 “学习区”。只有在学习区里面练习，一个人才可能进步。有效的练习任务必须精确的在受训者的 “学习区” 内进行，具有高度的针对性。在很多情况下这要求必须要有一个好的老师或者教练，从旁观者的角度更能发现我们最需要改进的地方。
            </p>
            <p>
                只在学习区练习，是一个非常强的要求。一般的学校课堂往往有几十人按照相同的进度学习知识，这种学习是没有针对性的。同样的内容，对某些同学来说是舒适区根本无需再练，而对某些学生则是恐慌区。科学教学必须因材施教，小班学习，甚至是一对一的传授。真正高手训练与其说是老师教学生，不如说是师傅带学徒。
。
            </p>

            <br/><h3>2. 大量重复训练</h3>

            <p>
                从不会到会，秘诀是重复。美国加州有个 “害羞诊所”（The Shyness Clinic），专门帮助那些比如说不敢和异性说话的人克服害羞心理。这个诊所的心理学家不相信什么心理暗示疗法，什么童年回忆之类，他们相信练习。他们认为使人害羞的并不是事情本身，而是我们对事情的观点。怎么治疗恐女症？做法是设计各种不同难度的场合进行对话训练。最初是在房间内集体对话，角色扮演。然后是到直接跑到大街上找陌生美女搭讪要求约会。最高难度是有意在公共场合做出使自己难堪的事情，比如去超市把一个西瓜掉在地上摔坏。

            </p>
            <p>
                这种把不常见的高难度事件重复化的办法正是 MBA 课程的精髓。在商学院里一个学生每周可能要面对 20 个真实发生过的商业案例，学生们首先自己研究怎么决策，提出解决方案，最后老师给出实际的结果并作点评。学习商业决策的最好办法不是观察老板每个月做两次决策，而是自己每周做 20 次模拟的决策。军事学院的模拟战，飞行员在计算机上模拟各种罕见的空中险情，包括丘吉尔对着镜子练习演讲，都是重复训练。
            </p>
            <p>
                在体育和音乐训练中，比较强调 “分块” 练习。首先你要把整个动作或者整首曲子过一遍，看专家是怎么做的。然后把它分解为很多小块，一块一块地学习掌握。在这种训练中一定要慢，只有慢下来才能感知技能的内部结构，注意到自己的错误。在美国一所最好的小提琴学校里，甚至有禁止学生把一支曲子连贯地演奏的要求，规定如果别人听出来你拉的是什么曲子，那就说明你没有正确练习。职业的体育训练往往是针对技术动作，而不是比赛本身。一个高水平的美式足球运动员只有 1% 的时间用于队内比赛，其他都是各种相关的基础训练。
            </p>
            <p>
                反过来说如果没有这种事先的重复训练，一个人面对不常见的事件往往会不知所措。统计表明工作多年的医生通过读 X 光片诊断罕见病症的水平反而不如刚毕业的医学院学生 — 因为很少遇到这种病例，而在医学院学到的东西早就忘了。最好的办法其实是定期地让医生们拿过去的旧 X 光片集中训练，而不是期待在工作中碰到。
            </p>

            <br/><h3>3. 持续获得有效的反馈</h3>

            <p>
                传道，授业，解惑，老师和教练最大的用处是什么？也许对一般人来说小学老师最大的作用是激发了他学习的兴趣，教会了他什么东西，曾经有过传道授业解惑。而真正的高手都有很强的自学能力，对他们而言，老师和教练的最重要作用是提供即时的反馈。
            </p>
            <p>
                一个动作做得好与不好，最好有教练随时指出，本人必须能够随时了解练习结果。看不到结果的练习等于没有练习：如果只是应付了事，你不但不会变好，而且会对好坏不再关心。在某种程度上，刻意练习是以错误为中心的练习。练习者必须建立起对错误的极度敏感，一旦发现自己错了会感到非常不舒服，一直练习到改正为止。
            </p>
            <p>
                从训练的角度，一个真正好教练是什么样的？John Wooden 是美国最具传奇色彩的大学篮球教练，他曾经率领 UCLA 队在 12 年内 10 次获得 NCAA 冠军。为了获得 Wooden 的执教秘诀，两位心理学家曾经全程观察他的训练课，甚至记录下了他给球员的每一条指令。结果统计表明，在记录的 2326 条指令之中, 6.9% 是表扬，6.6% 是表示不满，而有 75% 是纯粹的信息，也就是做什么动作和怎么做。他最常见的办法是三段论：演示一遍正确动作，表现一遍错误动作，再演示一遍正确动作。
            </p>
            <p>
                与外行想象的不同，最好的教练从不发表什么激情演说，甚至不讲课，说话从不超过 20 秒。他们只给学生非常具体的即时反馈。所有训练都事先进行无比详细的计划，甚至包括教运动员怎么系鞋带。他们仿佛有一种诡异的知道学员在想什么的能力，即使是第一次见面能指出学生在技术上最需要什么。他们是绝对的因材施教，源源不断地提供高度具有针对性的具体指导。
            </p>
            <p>
                获得反馈的最高境界是自己给自己当教练。高手工作的时候会以一个旁观者的角度观察自己，每天都有非常具体的小目标，对自己的错误极其敏感，并不断寻求改进。
            </p>

            <br/><h3>4. 精神高度集中</h3>

            <p>
                刻意练习没有 “寓教于乐” 这个概念。曾经有个著名小提琴家说过，如果你是练习手指，你可以练一整天；可是如果你是练习脑子，你每天能练两个小时就不错了。高手的练习每次最多 1 到 1.5 小时，每天最多 4 到 5 小时。没人受得了更多。一般女球迷可能认为贝克汉姆那样的球星很可爱，她们可能不知道的是很少有球员能完成贝克汉姆的训练强度，因为太苦了。
            </p>
            <p>
                科学家们曾经调查研究了一个音乐学院。他们把这里的所有小提琴学生分为好（将来主要是做音乐教师），更好，和最好（将来做演奏家）三个组。这三个组的学生 在很多方面都相同，比如都是从 8 岁左右开始练习，甚至现在每周的总的音乐相关活动（上课，学习， 练习）时间也相同，都是 51 个小时。
            </p>
            <p>
                研究人员发现，所有学生都了解一个道理：真正决定你水平的不是全班一起上的音乐课，而是单独练习：<br/>
                (1) 最好的两个组学生平均每周有 24 小时的单独练习，而第三个组只有 9 小时。<br/>
                (2) 他们都认为单独练习是最困难也是最不好玩的活动。<br/>
                (3) 最好的两个组的学生利用上午的晚些时候和下午的早些时候单独练习，这时候他们还很清醒；而第三个组利用下午的晚些时候单独练习，这时候他们已经很困了。<br/>
                (4) 最好的两个组不仅仅练得多，而且睡眠也多。他们午睡也多。
            </p>
            <p>
                那么是什么因素区分了前两个组呢？是学生的历史练习总时间。到 18 岁，最好的组中，学会平均总共练习了 7410 小时，而第二组是 5301 小时，第三组 3420 小时。第二组的人现在跟最好的组一样努力，可是已经晚了。可见要想成为世界级高手，一定要尽早投入训练，这就是为什么天才音乐家都是从很小的时候就开始苦练了。
            </p>

            <br/><h2>人脑的学习原理</h2>

            <p>
                现代神经科学和认知科学认为，几乎没有任何技能是人一出生就会的。哪怕是对简单物体的识别，把东西抓取过来这些简单的动作，也是婴儿后天学习的结果。一个人一出生的时候根本不可能预见到将来自己需要什么技能，基因不可能把一切技能都用遗传的方法事先编程，那样的话太浪费大脑的存储空间。最好的办法是不预设任何技能，只提供一个能够学习各种技能的能力，这就是人脑的巧妙之处。基因的做法是先预设一些对刺激的基本反应和感觉，比如看见好吃的东西我们会饿等等。这些基本的反应需要调动的神经较少。但对于更高级别的技能，比如演奏音乐，需要协调调动很多神经，就必须靠后天学习了。
            <p>
                人的任何一个技能，都是大脑内一系列神经纤维传递的电脉冲信号的组合。解剖表明拥有不同技能的人，其大脑的神经结构非常不同，比如出租车司机大脑内识别方向的区域就特别发达。也就是说与计算机不同，人对于技能的掌握是在大脑硬件层次实现的。
            </p>
            <p>
                而最近有一派科学家认为，髓磷脂是技能训练的关键，它的作用是像胶皮把电线包起来一样，把这些神经纤维给包起来，通过防止电脉冲外泄而使得信号更强，更快，更准确。不管练习什么，我们都是在练习大脑中的髓磷脂，就好像把一堆杂乱无章的电线被排列整齐变成电缆。直到 2000 年新技术允许科学家直接观察活体大脑内的髓磷脂之后，髓磷脂的作用才被发现，而且一直到 2006 年才第一次被在学术期刊上说明。科学家认为髓磷脂是脑神经的高速公路，提高信号传递速度，并且可以把延迟时间减少 30 倍，总共提速 3000 倍，甚至可以控制速度，想慢就慢。
            </p>
            <p>
                人脑之中分布着大量 “自由的” 髓磷脂，它们观测脑神经纤维的信号发射和组合，哪些神经纤维用的越多，它们就过去把这一段线路给包起来，使得线路中的信号传递更快，形成高速公路。这就是为什么练习是如此重要。
            </p>
            <p>
               髓磷脂理论可以解释很多事情。比如为什么小孩常会犯错？他们的神经系统都在，也知道对错，只是需要时间去建立起来髓磷脂的高速网络。为什么习惯一旦养成不容易改变？因为所谓 “习惯”，其实是以神经纤维电缆组合的形式 “长” 在大脑之中的，髓磷脂一旦把神经包起来，它不会自动散开 — 改变习惯的唯一办法是形成新习惯。为什么年轻人学东西快？因为尽管人的一生之中髓磷脂都在生长，但年轻人生长得最快。最激进的理论则认为人跟猴子的最显著区别不在于脑神经元的多少，而在于人的髓磷脂比猴子多 20%！解剖表明，爱因斯坦的大脑中的神经元数量是平均水平，但他拥有更多能够产生髓磷脂的细胞。
            </p>

            <br/><h2>谁愿意练习一万小时？</h2>

            <p>
                看了钢琴家朗朗的传记之后，可能很多人会怀疑是否真的应该让孩子接受这样的苦练。实际上，顶级运动员都是穷人家的孩子。不练这一万小时，一定成不了高手，但问题是考虑到机遇因素练了这一万小时也未必成功。
            </p>
            <p>
                这就是兴趣的作用了。如果说有什么成功因素是目前科学家无法用后天训练解释的，那就是兴趣。有的孩子似乎天生就对某一领域感兴趣。感兴趣并不一定说明他能做好，就算不感兴趣只要愿意练，也能练成。兴趣最大的作用是让人愿意在这个领域内苦练。
            </p>
            <p>
                不论如何，刻意练习是个科学方法，值得我们把它运用到日常工作中去。显然我们平时中做的绝大多数事情都不符合刻意练习的特点，这可能就是为什么大多数人都没能成为世界级高手。天才来自刻意练习。
            </p>
        </div>

        <!-- ***********回到顶部小火箭***********  -->
        <div id="back_to_top" title="back to top">
            <svg class="rocket" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="32" height="32" viewBox="0 0 32 32">
                <path fill="#A2A2A2" d="M9.508 29.049c0 0-0.295-1.772 1.525-3.936-1.771-4.968-2.017-9.493-2.017-9.493s-3.64 0.837-3.64 4.427c0.001 6.148
                    4.132 9.002 4.132 9.002zM19.541 26.891c0 0 2.438-7.824 2.438-11.069 0-1.46-0.165-2.759-0.421-3.939h-11.106c-0.258 1.18-0.424 2.48-0.424
                    3.94 0 3.196 2.431 11.068 2.431 11.068h7.082zM16.009 13.672c1.249 0 2.262 1.013 2.262 2.263 0 1.249-1.013 2.263-2.262 2.263-1.25
                    0-2.263-1.013-2.263-2.263-0.001-1.25 1.013-2.263 2.263-2.263zM16.495 3.567v-3.081h-0.881v3.002c-1.007 0.733-3.731 3.063-4.963
                    7.552h10.71c-1.191-4.366-3.784-6.671-4.866-7.474zM22.492 29.049c0 0 4.132-2.854 4.132-9.002 0-3.59-3.64-4.427-3.64-4.427s-0.246 4.524-2.016
                    9.493c1.82 2.165 1.525 3.936 1.525 3.936zM14.511 29.504l0.738-0.738 0.786 2.46 0.935-2.46 0.639 1.278 0.935-2.312h-5.066l1.031 1.772z"></path>
            </svg>
        </div>
        <script>
            $(document).ready(function() {
                var $backToTop =  $('#back_to_top');
                // Show or hide the sticky footer button
                $(window).scroll(function() {
                    if ($(window).scrollTop() > 300) {
                         $backToTop.fadeIn(800);
                    } else {
                        $backToTop.fadeOut(800);
                    }
                });
                // Animate the scroll to top
                $backToTop.click(function(event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: 0}, 320,'swing');
                })
            });
        </script>

        <!-- ***********底栏*********** -->
        <footer id="footer">
            <a href="404.jsp">Welcome to <i>GnohiS<b>iaM</b></i> , enjoy yourself ..</a>
        </footer>
    </body>
</html>
