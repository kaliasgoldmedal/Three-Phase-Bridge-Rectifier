close all
clear all
open_system('TFBR')
out = sim('TFBR');
hf = figure('units','normalized','outerposition',[0 0 1 1]);
hf.Color = 'w';

clc

D1rx1=[4 5 4.5 4 4.5 5 4 5 4.5 4.5];
D1ry1=[0 0 0 -1 0 -1 -1 -1 0 2];
D1rx2=[4.5 4.5];
D1ry2=[-1 -2];
D1txtxref=3.0;
D1txtyref=-0.25;


Vabc = squeeze(out.Vabc.Data)';
time  = squeeze(out.Vabc.Time);
Vab = Vabc(:,1)./max(Vabc(:,1));
Vbc = Vabc(:,2)./max(Vabc(:,2));
Vca = Vabc(:,3)./max(Vabc(:,3));

Vabcn = squeeze(out.Vabcn.Data)';
Van = Vabcn(:,1)./max(Vabcn(:,1));
Vbn = Vabcn(:,2)./max(Vabcn(:,2));
Vcn = Vabcn(:,3)./max(Vabcn(:,3));

Iabc = squeeze(out.Iabc.Data)';
Iab = Iabc(:,1)./max(Iabc(:,1));
Ibc = Iabc(:,2)./max(Iabc(:,2));
Ica = Iabc(:,3)./max(Iabc(:,3));

Vload = squeeze(out.Vload.Data)';
Vl = Vload(1,:)./max(Vload(:,1));


xmov=2;
ymov=7;


resx=[6.5,6.5,6.75,6.25,6.75,6.25,6.75,6.25,6.75,6.25,6.5,6.5];
resy=[D1ry1(end),-2,-2.25,-2.5,-2.75,-3,-3.25,-3.5,-3.75,-4,-4,D1ry2(end)-ymov];

a=resx./6.5;
resx=a.*(D1rx1(end)+(3*xmov));


 writeobj = VideoWriter('threct','Motion JPEG AVI');
 open(writeobj);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Leg 1 
D1 = plot(D1rx1,D1ry1,'k', D1rx2,D1ry2,'k');
text(D1txtxref+0.5,D1txtyref,'D1','FontSize',8);
set(D1,'LineWidth',1.5);
hold on

D4 = plot(D1rx1,D1ry1-ymov,'k', D1rx2,D1ry2-ymov,'k',D1rx2,[D1ry2(:,2)-(ymov-4),D1ry2(:,2)],'k');
text(D1txtxref+0.5,D1txtyref-ymov,'D4','FontSize',8);
set(D4,'LineWidth',1.5);
hold on

legm1=plot([D1rx2(:,2) D1rx2(:,2)-1.5],[D1ry2(:,2), D1ry2(:,2)],'k');
set(legm1,'LineWidth',1.5);
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
text(3.0,3,'THREE PHASE UNCONTROLLED RECTIFIER','FontSize',8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Leg 2

D3 = plot(D1rx1+xmov,D1ry1,'k', D1rx2+xmov,[-1,-3.5],'k');
text(D1txtxref+xmov+0.5,D1txtyref,'D3','FontSize',8);
set(D3,'LineWidth',1.5);
hold on

D6 = plot(D1rx1+xmov,D1ry1-ymov,'k', D1rx2+xmov,D1ry2-ymov,'k',D1rx2+xmov,[-5,-3.5],'k');
text(D1txtxref+xmov+0.5,D1txtyref-ymov,'D6','FontSize',8);
set(D6,'LineWidth',1.5);
hold on


legm2=plot([D1rx2(:,2)+xmov D1rx2(:,2)-1.5],[D1ry2(:,2)-1.5, D1ry2(:,2)-1.5],'k');
set(legm2,'LineWidth',1.5);
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D5 = plot(D1rx1+(2*xmov),D1ry1,'k', D1rx2+(2*xmov),D1ry2,'k',D1rx2+(2*xmov),[-2,-5],'k');
text(D1txtxref+(2*xmov)+0.5,D1txtyref,'D5','FontSize',8);
set(D5,'LineWidth',1.5);
hold on

D2 = plot(D1rx1+(2*xmov),D1ry1-ymov,'k', D1rx2+(2*xmov),D1ry2-ymov,'k');
text(D1txtxref+(2*xmov)+0.5,D1txtyref-ymov,'D2','FontSize',8);
set(D2,'LineWidth',1.5);
hold on

legm3=plot([D1rx2(:,2)+(2*xmov) D1rx2(:,2)-1.5],[D1ry2(:,2)-3, D1ry2(:,2)-3],'k');
set(legm3,'LineWidth',1.5);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Postive Rails
posrail1=plot([D1rx1(end),D1rx1(end)+xmov],[D1ry1(end),D1ry1(end)],'k');
set(posrail1,'LineWidth',1.5);
hold on

posrail2=plot([D1rx1(end)+xmov,D1rx1(end)+(2*xmov)],[D1ry1(end),D1ry1(end)],'k');
set(posrail2,'LineWidth',1.5);
hold on

%Negative Rails
negrail1=plot([D1rx1(end),D1rx1(end)+xmov],[D1ry2(end)-ymov,D1ry2(end)-ymov],'k');
set(negrail1,'LineWidth',1.5);
hold on

negrail2=plot([D1rx1(end)+xmov,D1rx1(end)+(2*xmov)],[D1ry2(end)-ymov,D1ry2(end)-ymov],'k');
set(negrail2,'LineWidth',1.5);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Line +ve
ldline1=plot([D1rx1(end)+(2*xmov),D1rx1(end)+(3*xmov)],[D1ry1(end),D1ry1(end)],'k');
set(ldline1,'LineWidth',1.5);
hold on

%Load Line -ve
ldline2=plot([D1rx1(end)+(2*xmov),D1rx1(end)+(3*xmov)],[D1ry2(end)-ymov,D1ry2(end)-ymov],'k');
set(ldline2,'LineWidth',1.5);
hold on

%Load Resistance
res=plot(resx,resy,'r');
set(res,'LineWidth',1.5);
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%AC Cources
vrn = nsidedpoly(1000, 'Center', [2.5 -2], 'Radius', 0.5);
hold on
AC1 = plot(vrn,'FaceColor', 'w','EdgeColor','k');
set(AC1,'LineWidth',2);
text(2.2,-2,'Vrn','FontSize',8);

vyn = nsidedpoly(1000, 'Center', [2.5 -3.5], 'Radius', 0.5);
hold on
AC2 = plot(vyn,'FaceColor', 'w','EdgeColor','k');
set(AC2,'LineWidth',2);
text(2.2,-3.5,'Vyn','FontSize',8);

vbn = nsidedpoly(1000, 'Center', [2.5 -5.0], 'Radius', 0.5);
hold on
AC3 = plot(vbn,'FaceColor', 'w','EdgeColor','k');
set(AC3,'LineWidth',2);
text(2.2,-5.0,'Vbn','FontSize',8);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%AC side lines
line_rn=plot([2,1],[-2,-2],'k');
set(line_rn,'LineWidth',1.5);
line_yn=plot([2,1],[-3.5,-3.5],'k');
set(line_yn,'LineWidth',1.5);
line_bn=plot([2,1],[-5,-5],'k');
set(line_bn,'LineWidth',1.5);
hold on

line_ry=plot([1,1],[-2,-3.5],'k');
set(line_ry,'LineWidth',1.5);
line_yb=plot([1,1],[-5,-3.5],'k');
set(line_yb,'LineWidth',1.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Right Side Plots
hold on
plot([resx(end)+2.5 resx(end)+15],[0 0],'k')%First Horizontal Line
hold on
plot([resx(end)+2.5 resx(end)+2.5],[-11 2],'k')%Vertical Line
hold on
plot([resx(end)+2.5 resx(end)+15],[-4 -4],'k')%2nd Horizontal Line
hold on
plot([resx(end)+2.5 resx(end)+15],[-8 -8],'k')%3rd Horizontal Line
hold on
text(17,2,'LOAD CURRENT (Phase R)','FontSize',8);
text(17,-2,'LOAD CURRENT (Phase Y)','FontSize',8);
text(17,-6,'LOAD CURRENT (Phase B)','FontSize',8);
text(25,-0.25,'\omegat','FontSize',10);
text(25,-4.25,'\omegat','FontSize',10);
text(25,-8.25,'\omegat','FontSize',10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Left Side Plots
plot([-13+1.5 -13+1.5],[-10 2],'k') %Vertical Line
hold on
plot([-13+1.5 -1+1.5],[0 0],'k')%First Horizontal Line
hold on
plot([-13+1.5 -1+1.5],[-4 -4],'k')%2nd Horizontal Line
hold on
plot([-13+1.5 -1+1.5],[-8 -8],'k')%3rd Horizontal Line
hold on

text(-10,2,'PHASE VOLTAGE-SOURCE','FontSize',8);
text(-10,-2,'LINE VOLTAGE-SOURCE','FontSize',8);
text(-11,-6,'LINE VOLTAGE 180 SHIFTED','FontSize',8);
text(-1+1.5,-0.25,'\omegat','FontSize',10);
text(-1.25+1.5,-4.25,'\omegat','FontSize',10);
text(-1+1.5,-8.25,'\omegat','FontSize',10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axis([-15 21 -18 5],'equal');
set(gca,'XColor', 'none','YColor','none')
set(gca, 'color', 'none')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Voltage Plot

plot([13 13],[-15 -11],'k')%VerticalLine
hold on
plot([13 25.5],[-15 -15],'k')%First Horizontal Line
hold on
text(18,-11,'DC LOAD VOLTAGE','FontSize',8);
text(25,-15.25,'\omegat','FontSize',10);
text(16,-16,'Developed By Dr.M.Kaliamoorthy','FontSize',8);
text(17.5,-16.5,'Professor/EE','FontSize',8);
text(17.5,-17,'Dr.MCET, India','FontSize',8);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Phasor Diagram
angVr = mod((2*pi*50.*time),2*pi)*(180/pi);
angVy = mod((2*pi*50.*time)-(2*pi/3),2*pi)*(180/pi);
angVb = mod((2*pi*50.*time)+(2*pi/3),2*pi)*(180/pi);

angVry = mod((2*pi*50.*time)-(pi/6),2*pi)*(180/pi);
angVyb = mod((2*pi*50.*time)-(2*pi/3)-(pi/6),2*pi)*(180/pi);
angVbr = mod((2*pi*50.*time)+(2*pi/3)-(pi/6),2*pi)*(180/pi);

angVrys = mod((2*pi*50.*time)-(pi/6)+pi,2*pi)*(180/pi);
angVybs = mod((2*pi*50.*time)-(2*pi/3)-(pi/6)+pi,2*pi)*(180/pi);
angVbrs = mod((2*pi*50.*time)+(2*pi/3)-(pi/6)+pi,2*pi)*(180/pi);
Nf=4001;
tc = linspace(0,2*pi,Nf); % vector of angles to draw circles
circ_radius = 4;
Line_Circle= plot(((circ_radius-2)*sqrt(3)*cos(tc))+5,(circ_radius-2)*sqrt(3)*sin(tc)-13.5);
Phase_Circle= plot(((circ_radius-2)*cos(tc))+5,(circ_radius-2)*sin(tc)-13.5);
pos1 = get(gca, 'Position');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vrn_Wave=animatedline('LineWidth',1.5,'Color',"r",'LineStyle',"-.");
Vyn_Wave=animatedline('LineWidth',1.5,'Color',[0.9290 0.6940 0.1250],'LineStyle',"-.");
Vbn_Wave=animatedline('LineWidth',1.5,'Color',"b",'LineStyle',"-.");




Vry_Wave=animatedline('LineWidth',1.5,'Color',"r");
Vyb_Wave=animatedline('LineWidth',1.5,'Color',[0.9290 0.6940 0.1250]);
Vbr_Wave=animatedline('LineWidth',1.5,'Color',"b");

Vry_SWave=animatedline('LineWidth',1.5,'Color',"r",'LineStyle',":");
Vyb_SWave=animatedline('LineWidth',1.5,'Color',[0.9290 0.6940 0.1250],'LineStyle',":");
Vbr_SWave=animatedline('LineWidth',1.5,'Color',"b",'LineStyle',":");

Iry_Wave=animatedline('LineWidth',1.5,'Color',"r");
Iyb_Wave=animatedline('LineWidth',1.5,'Color',[0.9290 0.6940 0.1250]);
Ibr_Wave=animatedline('LineWidth',1.5,'Color',"b");

Vl_wave=animatedline('LineWidth',1.5,'Color',"m");

lgd = legend([Vrn_Wave Vyn_Wave Vbn_Wave Vry_Wave Vyb_Wave Vbr_Wave Vry_SWave Vyb_SWave Vbr_SWave], 'Vrn', 'Vyn', 'Vbn','Vry','Vyb','Vbr','Vyr','Vby','Vrb','Location','southwest','Orientation','horizontal','TextColor','blue','FontSize',10,'AutoUpdate','off');
lgd.NumColumns = 3;

Vrn_Phasor=animatedline('LineWidth',2,'Color',"r",'LineStyle',"-.");
Vrn_Phasor_cursor=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

Vyn_Phasor=animatedline('LineWidth',2,'Color',[0.9290 0.6940 0.1250],'LineStyle',"-.");
Vyn_Phasor_cursor=animatedline('LineWidth',2,'Color',[0.9290 0.6940 0.1250], 'Marker', '.', 'MarkerSize', 20);

Vbn_Phasor=animatedline('LineWidth',2,'Color',"b",'LineStyle',"-.");
Vbn_Phasor_cursor=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize', 20);

Vry_Phasor=animatedline('LineWidth',2,'Color',"r");
Vry_Phasor_cursor=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

Vyb_Phasor=animatedline('LineWidth',2,'Color',[0.9290 0.6940 0.1250]);
Vyb_Phasor_cursor=animatedline('LineWidth',2,'Color',[0.9290 0.6940 0.1250], 'Marker', '.', 'MarkerSize', 20);

Vbr_Phasor=animatedline('LineWidth',2,'Color',"b");
Vbr_Phasor_cursor=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize', 20);

Vrys_Phasor=animatedline('LineWidth',2,'Color',"r",'LineStyle',":");
Vrys_Phasor_cursor=animatedline('LineWidth',2,'Color',"r", 'Marker', '.', 'MarkerSize', 20);

Vybs_Phasor=animatedline('LineWidth',2,'Color',[0.9290 0.6940 0.1250],'LineStyle',":");
Vybs_Phasor_cursor=animatedline('LineWidth',2,'Color',[0.9290 0.6940 0.1250], 'Marker', '.', 'MarkerSize', 20);

Vbrs_Phasor=animatedline('LineWidth',2,'Color',"b",'LineStyle',":");
Vbrs_Phasor_cursor=animatedline('LineWidth',2,'Color',"b", 'Marker', '.', 'MarkerSize', 20);

L = rescale(time,-13+1.5,-2+1.5);   %Scale Left
R = rescale(time,13,25);    %Scale Right
C = rescale(time,13,25);     %Scale Centre
Vab_rs=rescale(Vab,-5,-3);
Vbc_rs=rescale(Vbc,-5,-3);
Vca_rs=rescale(Vca,-5,-3);

Vab_rs_shift=rescale(-1*Vab,-9,-7);
Vbc_rs_shift=rescale(-1*Vbc,-9,-7);
Vca_rs_shift=rescale(-1*Vca,-9,-7);

Iab_rs=rescale(Iab,-1,1);
Ibc_rs=rescale(Ibc,-5,-3);
Ica_rs=rescale(Ica,-9,-7);

vl_rs=rescale(Vl,-13,-12);

plot([5-(circ_radius-2)*sqrt(3) 5+(circ_radius-2)*sqrt(3)],[-13.5 -13.5],'LineStyle',":",'LineWidth',1.5,'Color',"k");%%%%%%% horizontal dotted line for phasor 
plot([5 5],[-13.5-(circ_radius-2)*sqrt(3) -13.5+(circ_radius-2)*sqrt(3)],'LineStyle',":",'LineWidth',1.5,'Color',"k");%%%%%%% vertical dotted line for phasor 
annotation('textarrow',[-0.76 -0.79]+1.35,[0.27 0.27],'String','REF','FontSize',10,'Linewidth',1.5,'TextColor','r')

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:10:length(time)
    clearpoints(Vrn_Phasor);
    clearpoints(Vrn_Phasor_cursor);

    clearpoints(Vyn_Phasor);
    clearpoints(Vyn_Phasor_cursor);

    clearpoints(Vbn_Phasor);
    clearpoints(Vbn_Phasor_cursor);

    clearpoints(Vry_Phasor);
    clearpoints(Vry_Phasor_cursor);

    clearpoints(Vyb_Phasor);
    clearpoints(Vyb_Phasor_cursor);

    clearpoints(Vbr_Phasor);
    clearpoints(Vbr_Phasor_cursor);

    clearpoints(Vrys_Phasor);
    clearpoints(Vrys_Phasor_cursor);

    clearpoints(Vybs_Phasor);
    clearpoints(Vybs_Phasor_cursor);

    clearpoints(Vbrs_Phasor);
    clearpoints(Vbrs_Phasor_cursor);

   

    addpoints(Vrn_Wave,L(i),Van(i));
    addpoints(Vyn_Wave,L(i),Vbn(i));
    addpoints(Vbn_Wave,L(i),Vcn(i));

    addpoints(Vry_Wave,L(i),Vab_rs(i));
    addpoints(Vyb_Wave,L(i),Vbc_rs(i));
    addpoints(Vbr_Wave,L(i),Vca_rs(i));

    addpoints(Vry_SWave,L(i),Vab_rs_shift(i));
    addpoints(Vyb_SWave,L(i),Vbc_rs_shift(i));
    addpoints(Vbr_SWave,L(i),Vca_rs_shift(i));

    addpoints(Iry_Wave,R(i),Iab_rs(i));
    addpoints(Iyb_Wave,R(i),Ibc_rs(i));
    addpoints(Ibr_Wave,R(i),Ica_rs(i));

    addpoints(Vl_wave,C(i),vl_rs(i));

    addpoints(Vrn_Phasor,[5, 2*cosd(angVr(i))+5],[-13.5,2*sind(angVr(i))-13.5]);
    addpoints(Vrn_Phasor_cursor,2*cosd(angVr(i))+5,2*sind(angVr(i))-13.5);
    txt_vrn = text(2.25*cosd(angVr(i))+5, 2.25*sind(angVr(i))-13.5,'Vrn'); 

    addpoints(Vyn_Phasor,[5, 2*cosd(angVy(i))+5],[-13.5,2*sind(angVy(i))-13.5]);
    addpoints(Vyn_Phasor_cursor,2*cosd(angVy(i))+5,2*sind(angVy(i))-13.5);
    txt_vyn = text(2.25*cosd(angVy(i))+5, 2.25*sind(angVy(i))-13.5,'Vyn');

    addpoints(Vbn_Phasor,[5, 2*cosd(angVb(i))+5],[-13.5,2*sind(angVb(i))-13.5]);
    addpoints(Vbn_Phasor_cursor,2*cosd(angVb(i))+5,2*sind(angVb(i))-13.5);
    txt_vbn = text(2.25*cosd(angVb(i))+5, 2.25*sind(angVb(i))-13.5,'Vbn');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    addpoints(Vry_Phasor,[5, (circ_radius-2)*sqrt(3)*cosd(angVry(i))+5],[-13.5,(circ_radius-2)*sqrt(3)*sind(angVry(i))-13.5]);
    addpoints(Vry_Phasor_cursor,(circ_radius-2)*sqrt(3)*cosd(angVry(i))+5, (circ_radius-2)*sqrt(3)*sind(angVry(i))-13.5);
    txt_vry = text((circ_radius-1.75)*sqrt(3)*cosd(angVry(i))+5, (circ_radius-1.75)*sqrt(3)*sind(angVry(i))-13.5,'Vry'); 

    addpoints(Vyb_Phasor,[5, (circ_radius-2)*sqrt(3)*cosd(angVyb(i))+5],[-13.5,(circ_radius-2)*sqrt(3)*sind(angVyb(i))-13.5]);
    addpoints(Vyb_Phasor_cursor,(circ_radius-2)*sqrt(3)*cosd(angVyb(i))+5, (circ_radius-2)*sqrt(3)*sind(angVyb(i))-13.5);
    txt_vyb = text((circ_radius-1.75)*sqrt(3)*cosd(angVyb(i))+5, (circ_radius-1.75)*sqrt(3)*sind(angVyb(i))-13.5,'Vyb'); 

    addpoints(Vbr_Phasor,[5, (circ_radius-2)*sqrt(3)*cosd(angVbr(i))+5],[-13.5,(circ_radius-2)*sqrt(3)*sind(angVbr(i))-13.5]);
    addpoints(Vbr_Phasor_cursor,(circ_radius-2)*sqrt(3)*cosd(angVbr(i))+5, (circ_radius-2)*sqrt(3)*sind(angVbr(i))-13.5);
    txt_vbr = text((circ_radius-1.75)*sqrt(3)*cosd(angVbr(i))+5, (circ_radius-1.75)*sqrt(3)*sind(angVbr(i))-13.5,'Vbr'); 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    addpoints(Vrys_Phasor,[5, (circ_radius-2)*sqrt(3)*cosd(angVrys(i))+5],[-13.5,(circ_radius-2)*sqrt(3)*sind(angVrys(i))-13.5]);
    addpoints(Vrys_Phasor_cursor,(circ_radius-2)*sqrt(3)*cosd(angVrys(i))+5, (circ_radius-2)*sqrt(3)*sind(angVrys(i))-13.5);
    txt_vrys = text((circ_radius-1.75)*sqrt(3)*cosd(angVrys(i))+5, (circ_radius-1.75)*sqrt(3)*sind(angVrys(i))-13.5,'Vyr'); 

    addpoints(Vybs_Phasor,[5, (circ_radius-2)*sqrt(3)*cosd(angVybs(i))+5],[-13.5,(circ_radius-2)*sqrt(3)*sind(angVybs(i))-13.5]);
    addpoints(Vybs_Phasor_cursor,(circ_radius-2)*sqrt(3)*cosd(angVybs(i))+5, (circ_radius-2)*sqrt(3)*sind(angVybs(i))-13.5);
    txt_vybs = text((circ_radius-1.75)*sqrt(3)*cosd(angVybs(i))+5, (circ_radius-1.75)*sqrt(3)*sind(angVybs(i))-13.5,'Vby'); 

    addpoints(Vbrs_Phasor,[5, (circ_radius-2)*sqrt(3)*cosd(angVbrs(i))+5],[-13.5,(circ_radius-2)*sqrt(3)*sind(angVbrs(i))-13.5]);
    addpoints(Vbrs_Phasor_cursor,(circ_radius-2)*sqrt(3)*cosd(angVbrs(i))+5, (circ_radius-2)*sqrt(3)*sind(angVbrs(i))-13.5);
    txt_vbrs = text((circ_radius-1.75)*sqrt(3)*cosd(angVbrs(i))+5, (circ_radius-1.75)*sqrt(3)*sind(angVbrs(i))-13.5,'Vrb'); 


if Iab(i)>=0.1 && Ibc(i)<=-0.1
        set(D1,'Color','k');
        set(D2,'Color',[0.7 0.7 0.7]);
        set(D3,'Color',[0.7 0.7 0.7]);
        set(D4,'Color',[0.7 0.7 0.7]);
        set(D5,'Color',[0.7 0.7 0.7]);
        set(D6,'Color','k');
        set(posrail1,'Color','k');
        set(posrail2,'Color','k');
        set(negrail1,'Color',[0.7 0.7 0.7]);
        set(negrail2,'Color','k');
        set(ldline1,'Color','k');
        set(ldline2,'Color','k');
        set(res,'Color','k');
        set(legm1,'Color','k');
        set(legm2,'Color','k');
        set(legm3,'Color',[0.7 0.7 0.7]);
        set(AC1,'EdgeColor','k');
        set(AC2,'EdgeColor','k');
        set(AC3,'EdgeColor',[0.7 0.7 0.7]);
        set(line_rn,'Color','k');
        set(line_yn,'Color','k');
        set(line_bn,'Color',[0.7 0.7 0.7]);
        set(line_ry,'Color','k');
        set(line_yb,'Color',[0.7 0.7 0.7]);
       
 end
 if Iab(i)>=0.1 && Ica(i)<=-0.10
        set(D1,'Color','k');
        set(D2,'Color','k');
        set(D3,'Color',[0.7 0.7 0.7]);
        set(D4,'Color',[0.7 0.7 0.7]);
        set(D5,'Color',[0.7 0.7 0.7]);
        set(D6,'Color',[0.7 0.7 0.7]);
        set(posrail1,'Color','k');
        set(posrail2,'Color','k');
        set(negrail1,'Color',[0.7 0.7 0.7]);
        set(negrail2,'Color',[0.7 0.7 0.7]);
        set(ldline1,'Color','k');
        set(ldline2,'Color','k');
        set(res,'Color','k');
        set(legm1,'Color','k');
        set(legm2,'Color',[0.7 0.7 0.7]);
        set(legm3,'Color','k');
        set(AC1,'EdgeColor','k');
        set(AC2,'EdgeColor',[0.7 0.7 0.7]);
        set(AC3,'EdgeColor','k');
        set(line_rn,'Color','k');
        set(line_yn,'Color',[0.7 0.7 0.7]);
        set(line_bn,'Color','k');
        set(line_ry,'Color','k');
        set(line_yb,'Color','k');
       
 end
 if Ibc(i)>=0.1 && Iab(i)<=-0.1
        set(D1,'Color',[0.7 0.7 0.7]);
        set(D2,'Color',[0.7 0.7 0.7]);
        set(D3,'Color','k');
        set(D4,'Color','k');
        set(D5,'Color',[0.7 0.7 0.7]);
        set(D6,'Color',[0.7 0.7 0.7]);
        set(posrail1,'Color',[0.7 0.7 0.7]);
        set(posrail2,'Color','k');
        set(negrail1,'Color','k');
        set(negrail2,'Color','k');
        set(ldline1,'Color','k');
        set(ldline2,'Color','k');
        set(res,'Color','k');
        set(legm1,'Color','k');
        set(legm2,'Color','k');
        set(legm3,'Color',[0.7 0.7 0.7]);
        set(AC1,'EdgeColor','k');
        set(AC2,'EdgeColor','k');
        set(AC3,'EdgeColor',[0.7 0.7 0.7]);
        set(line_rn,'Color','k');
        set(line_yn,'Color','k');
        set(line_bn,'Color',[0.7 0.7 0.7]);
        set(line_ry,'Color','k');
        set(line_yb,'Color',[0.7 0.7 0.7]);
        
 end
 if Ibc(i)>=0.1 && Ica(i)<=-0.1
        set(D1,'Color',[0.7 0.7 0.7]);
        set(D2,'Color','k');
        set(D3,'Color','k');
        set(D4,'Color',[0.7 0.7 0.7]);
        set(D5,'Color',[0.7 0.7 0.7]);
        set(D6,'Color',[0.7 0.7 0.7]);
        set(posrail1,'Color',[0.7 0.7 0.7]);
        set(posrail2,'Color','k');
        set(negrail1,'Color',[0.7 0.7 0.7]);
        set(negrail2,'Color',[0.7 0.7 0.7]);
        set(ldline1,'Color','k');
        set(ldline2,'Color','k');
        set(res,'Color','k');
        set(legm1,'Color',[0.7 0.7 0.7]);
        set(legm2,'Color','k');
        set(legm3,'Color','k');
        set(AC1,'EdgeColor',[0.7 0.7 0.7]);
        set(AC2,'EdgeColor','k');
        set(AC3,'EdgeColor','k');
        set(line_rn,'Color',[0.7 0.7 0.7]);
        set(line_yn,'Color','k');
        set(line_bn,'Color','k');
        set(line_ry,'Color',[0.7 0.7 0.7]);
        set(line_yb,'Color','k');
       
 end
if Ica(i)>=0.1 && Iab(i)<=-0.1
        set(D1,'Color',[0.7 0.7 0.7]);
        set(D2,'Color',[0.7 0.7 0.7]);
        set(D3,'Color',[0.7 0.7 0.7]);
        set(D4,'Color','k');
        set(D5,'Color','k');
        set(D6,'Color',[0.7 0.7 0.7]);
        set(posrail1,'Color',[0.7 0.7 0.7]);
        set(posrail2,'Color',[0.7 0.7 0.7]);
        set(negrail1,'Color','k');
        set(negrail2,'Color','k');
        set(ldline1,'Color','k');
        set(ldline2,'Color','k');
        set(res,'Color','k');
        set(legm1,'Color','k');
        set(legm2,'Color',[0.7 0.7 0.7]);
        set(legm3,'Color','k');
        set(AC1,'EdgeColor','k');
        set(AC2,'EdgeColor',[0.7 0.7 0.7]);
        set(AC3,'EdgeColor','k');
        set(line_rn,'Color','k');
        set(line_yn,'Color',[0.7 0.7 0.7]);
        set(line_bn,'Color','k');
        set(line_ry,'Color','k');
        set(line_yb,'Color','k');
        
end
if Ica(i)>=0.1 && Ibc(i)<=-0.1
        set(D1,'Color',[0.7 0.7 0.7]);
        set(D2,'Color',[0.7 0.7 0.7]);
        set(D3,'Color',[0.7 0.7 0.7]);
        set(D4,'Color',[0.7 0.7 0.7]);
        set(D5,'Color','k');
        set(D6,'Color','k');
        set(posrail1,'Color',[0.7 0.7 0.7]);
        set(posrail2,'Color',[0.7 0.7 0.7]);
        set(negrail1,'Color',[0.7 0.7 0.7]);
        set(negrail2,'Color','k');
        set(ldline1,'Color','k');
        set(ldline2,'Color','k');
        set(res,'Color','k');
        set(legm1,'Color',[0.7 0.7 0.7]);
        set(legm2,'Color','k');
        set(legm3,'Color','k');
        set(AC1,'EdgeColor',[0.7 0.7 0.7]);
        set(AC2,'EdgeColor','k');
        set(AC3,'EdgeColor','k');
        set(line_rn,'Color',[0.7 0.7 0.7]);
        set(line_yn,'Color','k');
        set(line_bn,'Color','k');
        set(line_ry,'Color',[0.7 0.7 0.7]);
        set(line_yb,'Color','k');
        
   end
    drawnow
      currFrame=getframe(hf);
      writeVideo(writeobj, currFrame)
     set(txt_vry, 'String', ' ');
     set(txt_vyb, 'String', ' ');
     set(txt_vbr, 'String', ' ');
     set(txt_vrys, 'String', ' ');
     set(txt_vybs, 'String', ' ');
     set(txt_vbrs, 'String', ' ');
     set(txt_vrn, 'String', ' ');
     set(txt_vyn, 'String', ' ');
     set(txt_vbn, 'String', ' ');
end
 close(writeobj)


