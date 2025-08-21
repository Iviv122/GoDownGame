shader_type canvas_item;

// copied and modified from here https://thebookofshaders.com/edit.php#12/vorono-01.frag

uniform float Seed = 1;
uniform float Scale = 1;
uniform float ScrollSpeedX = 1;
uniform float ScrollSpeedY = 1;
uniform float Speed = 1;
uniform vec3 GroundColor;

void vertex() {

}

vec2 random2( vec2 p ) {
    return fract(cos(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*Seed);
}

void fragment() {

	vec2 st = UV;

	st.x += TIME*ScrollSpeedX;
	st.y += TIME*ScrollSpeedY;

	st *= Scale;

	vec2 i_st = floor(st);
    vec2 f_st = fract(st);

	float m_dist = 1.;

    vec2 m_point; // minimum point
	vec2 point = random2(i_st);

	//vec3 color = vec3(1);

	vec3 color = vec3(.0);


    for (int j=-1; j<=1; j++ ) {
        for (int i=-1; i<=1; i++ ) {
            vec2 neighbor = vec2(float(i),float(j));
            vec2 point = random2(i_st + neighbor);
            //point = 0.5 + 0.5*sin(u_time + 6.2831*point);
            vec2 diff = neighbor + point - f_st;
            float dist = length(diff);

            if( dist < m_dist ) {
                m_dist = dist;
                m_point = point;
            }
        }
    }

	//color -= m_dist;
	//color += m_dist;
	color += dot(m_point,vec2(.3,.6));
	//COLOR = vec4(color.r/UV.y,(color.g/UV.y)/2.,color.b,COLOR.a);

	//color -= step(.7,abs(sin(27.0*m_dist)))*.5;
	//color -= smoothstep(.1,.7,abs(sin(27.0*m_dist)))*.5;
	color *= GroundColor;
	//color -= smoothstep(0.1,.7,abs(m_dist))*.5;
	COLOR = vec4(color,COLOR.a);
}
