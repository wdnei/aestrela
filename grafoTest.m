a=Node('a');
b=Node('b');
c=Node('c');
d=Node('d');
e=Node('e');
f=Node('f');
g=Node('g');
h=Node('h');

a.addFilho(b);
a.addFilho(c);
b.addFilho(d);
c.addFilho(d);
c.addFilho(e);
d.addFilho(f);
g.addFilho(h);


ShowGrafo({a,b,c,d,e,f,g,h});

