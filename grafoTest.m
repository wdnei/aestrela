a=Grafo('a');
b=Grafo('b');
c=Grafo('c');
d=Grafo('d');
e=Grafo('e');
f=Grafo('f');
g=Grafo('g');
h=Grafo('h');

a.addFilho(b);
a.addFilho(c);
b.addFilho(d);
c.addFilho(d);
c.addFilho(e);
d.addFilho(f);
g.addFilho(h);


ShowGrafo({a,b,c,d,e,f,g,h});

