
#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;
uniform vec2 u_resolution;
uniform float u_time;

const float min_scale = 150.0;
const float max_scale = 150.0;

vec2 random2( vec2 p ) {
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*43758.5453);
}

void main() {
    
    float scale = min_scale + (max_scale - min_scale) * (0.5 + sin(u_time * 0.677) * 0.5);
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    st.x *= u_resolution.x / u_resolution.y;
    
    st *= scale;
    
    vec2 i_st = floor(st);
    vec2 f_st = fract(st);
    float m_dist = 100.;  // minimum distance
    vec2 uv = st;
    for(int y = -1; y <= 1; ++y){
        for(int x = -1; x <= 1; ++x){
        	vec2 neighbor = vec2(float(x),float(y));
            vec2 point = random2(i_st + neighbor);
            point = 0.5 + 0.5*sin(u_time + 6.2831*point);
            vec2 diff = neighbor + point - f_st;
            float dist = length(diff);

            // Keep the closer distance
            if(dist < m_dist){
            	m_dist = dist;
                uv = st + diff;
            }
        }
    }
    
    
    uv /= scale;
    uv.x /= u_resolution.x / u_resolution.y;
    vec3 color = texture(u_tex0, uv).rgb;
    //color += m_dist;
    
    //center
    //color += 1.-step(.06, m_dist);
    
    //color.r +=  step(0.98, f_st.x) + step(0.98, f_st.y);
    
    gl_FragColor = vec4(color, 1.0);
}

