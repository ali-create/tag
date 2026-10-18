function pointAtDistance(x1, y1, x2, y2, ratio) {
    var t = max(0, min(1, ratio));
    return {
        x: lerp(x1, x2, t),
        y: lerp(y1, y2, t)
    };
}