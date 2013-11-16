//
//  Shader.fsh
//  gametest
//
//  Created by You on 13-5-29.
//  Copyright (c) 2013年 NG. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
