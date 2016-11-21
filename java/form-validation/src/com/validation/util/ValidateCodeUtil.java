package com.validation.util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 该类生成一个由随机数字和字母组成的图片
 * 配合ValidateCodeServlet一起使用，Servlet内部代码如下：{
 *     response.setContentType("image/jpeg");
 *     response.setHeader("Pragma", "No-cache");
 *     response.setHeader("Cache-Control", "no-cache");
 *     response.setDateHeader("Expire", 0);
 *     ValidateCode imgObj = new ValidateCode();
 *     request.getSession().setAttribute("validCode", imgObj.getCode());
 *     ImageIO.write(imgObj.getBuffImg(), "jpeg", response.getOutputStream());
 * }
 * @author GnohisiaM
 */
public class ValidateCodeUtil {

    private int width = 80;            //图片宽
    private int height = 32;           //图片高
    private int lineSize = 80;         //干扰线数量
    private int codeCount = 4;         //随机产生字符数量
    private int x = 0;
    private int codeY;
    private int fontHeight;
    private String Code;
    private BufferedImage buffImg;
    static char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
            'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
            'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
            'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
            'w', 'x', 'y', 'z', 'o', '1', '2', '3', '4', '5', '6', '7', '8',
            '9' };
    private Random random = new Random();    //创建一个随机数生成器类

    public ValidateCodeUtil() {
        x = width / (codeCount + 2) + 4;
        fontHeight = height - 2;
        codeY = height - 6;
        CreateCode();
    }

    public void CreateCode() {
        // 定义图像buffer
        BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = buffImg.createGraphics();

        // 给图像填充随机背景色
        g.setColor(getRandColor(220, 255));
        g.fillRect(0, 0, width, height);

        // 创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
        // 设置字体。
        g.setFont(font);

        // 绘制干扰线
        g.setColor(getRandColor(190, 210));
        for(int i = 0; i <= lineSize; i++) {
            drawLine(g);
        }

        // 画边框。
        //g.setColor(Color.GRAY);
        //g.drawRect(0, 0, width - 1, height - 1);

        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer();

        // 随机产生codeCount数字的验证码。
        for (int i = 0; i < codeCount; i++) {
            // 得到随机产生的验证码数字。
            String strRand = String.valueOf(codeSequence[random.nextInt(62)]);

            // 用随机产生的颜色将验证码绘制到图像中。
            g.setColor(getRandColor(60, 180));
            //g.drawString(strRand, (i) * x + 20, codeY);

            //随机轻微移动位置
            g.translate(random.nextInt(2), random.nextInt(2));
            //将文字旋转制定角度
            AffineTransform trans = new AffineTransform();
            trans.rotate((random.nextInt(40) - 20) * Math.PI / 180, (i) * x + 6, codeY);
            //缩放文字
            float scaleSize = random.nextFloat() + 0.8f;
            if (scaleSize > 1f) scaleSize = 1f;
            trans.scale(scaleSize, scaleSize);
            g.setTransform(trans);
            g.drawString(strRand, (i) * x + 6, codeY);

            // 将产生的codeCount个随机数组合在一起。
            randomCode.append(strRand);
        }
        g.dispose();    //释放g所占用的系统资源
        this.Code = randomCode.toString().toUpperCase();
        this.buffImg = buffImg;

    }

    //该方法主要作用是获得随机生成的颜色
    private Color getRandColor(int s,int e) {
        if(s > 255) s = 255;
        if(e > 255) e = 255;
        int r,g,b;
        r = s+ random.nextInt(e - s);    //随机生成RGB颜色中的r值
        g = s+ random.nextInt(e - s);    //随机生成RGB颜色中的g值
        b = s+ random.nextInt(e - s);    //随机生成RGB颜色中的b值
        return new Color(r, g, b);
    }

    //该方法主要作用是绘制干扰线
    private void drawLine(Graphics g) {
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(26);
        int yl = random.nextInt(18);
        //g.drawLine(x, y, x + xl, y + yl);
        BasicStroke bs=new BasicStroke(2f,BasicStroke.CAP_BUTT,BasicStroke.JOIN_BEVEL);    //定制线条样式
        Line2D line=new Line2D.Double(x, y, x + xl, y + yl);
        Graphics2D g2d=(Graphics2D)g;        //创建Grapchics2D对象
        g2d.setStroke(bs);
        g2d.draw(line);     //绘制直线
    }

    public String getCode() {
        return Code;
    }

    public BufferedImage getBuffImg() {
        return buffImg;
    }
}
