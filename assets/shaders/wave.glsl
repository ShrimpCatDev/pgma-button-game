extern float time;
extern float ampX;
extern float ampY;
extern float freqX;
extern float freqY;
extern float speedX;
extern float speedY;

vec4 effect(vec4 color, Image texture, vec2 tex, vec2 sc) {
    float wx=cos((tex.y*freqX)+(time*speedX))*ampX;
    float wy=sin((tex.x*freqY)+(time*speedY))*ampY;

    vec2 d=vec2(tex.x+wx,tex.y+wy);
    return Texel(texture,d);
}