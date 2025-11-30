function AffBloc(center,t_bloc)

c=center;
t=t_bloc;
r=(t-1)/2;

for k=1:size(c,1)
 rectangle('Position',[c(k,2)-r,c(k,1)-r,t,t],'EdgeColor','r')
end