-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2020 a las 04:29:36
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cslp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `objectives` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `activities`
--

INSERT INTO `activities` (`id`, `name`, `objectives`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Imprimiendo en Consola', '{\"correct_result\":{\"points\":10,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 06:25:43', '2016-10-25 09:25:43'),
(2, '¿Que son las Variables?', '{\"correct_result\":{\"points\":2,\"condition\":2},\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:46:25', '2016-10-25 08:46:25'),
(3, 'Tomemos una Decisión', '{\"correct_result\":{\"points\":3,\"condition\":1,\"values\":[\"La sentencia es verdadera\"]},\"use_variable\":{\"points\":3,\"condition\":2},\"use_conditional\":{\"points\":7,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"51eH;[1XS(_{]:|r;UJt\" x=\"93\" y=\"60\"><field name=\"VAR\">elemento</field><value name=\"VALUE\"><block type=\"math_number\" id=\"dOERj,Mi,q_toWqzeeby\"><field name=\"NUM\">0</field></block></value><next><block type=\"controls_if\" id=\"T;!zZqVZ(A-[ug1(u7F9\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"b7+Iz#53Vg1EvV0}g|[G\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"variables_get\" id=\"bGk7]ETnA0ZYf1mVW46s\"><field name=\"VAR\">elemento</field></block></value><value name=\"B\"><block type=\"math_number\" id=\"zLo}Jw]{m4wu-(*K8w1O\"><field name=\"NUM\">0</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"CvAsCCtBgd7fj:*xVgp=\"><value name=\"CONSOLE\"><block type=\"text\" id=\"{`|96sUD_.Ue[y!dpkY4\"><field name=\"TEXT\">La sentencia es verdadera</field></block></value></block></statement></block></next></block></xml>', '2016-12-19 05:33:17', '2016-12-19 08:33:17'),
(4, 'Hay que repetirlo! :D', '{\"correct_result\":{\"points\":4,\"condition\":2},\"use_loop\":{\"points\":6,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 06:24:04', '2016-10-25 09:24:04'),
(5, 'Utilizando Funciones', '{\"use_function\":{\"points\":30,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:06:21', '2016-10-25 08:06:21'),
(6, 'Rito Metabólico Basal', '{\"correct_result\":{\"points\":3,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":1,\"condition\":1},\"use_conditional\":{\"points\":1,\"condition\":1},\"use_function\":{\"points\":2,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2017-04-10 17:41:21', '2017-04-10 17:41:21'),
(7, 'Calorías Diarias', '{\"correct_result\":{\"points\":3,\"condition\":1},\"use_variable\":{\"points\":1,\"condition\":1},\"use_conditional\":{\"points\":1,\"condition\":1},\"use_loop\":{\"points\":1,\"condition\":1},\"use_function\":{\"points\":2,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:06:25', '2016-10-25 08:06:25'),
(8, 'Calorías en la Comida', '{\"correct_result\":{\"points\":3,\"condition\":1},\"use_variable\":{\"points\":1,\"condition\":1},\"use_conditional\":{\"points\":1,\"condition\":1},\"use_loop\":{\"points\":1,\"condition\":1},\"use_function\":{\"points\":2,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:06:27', '2016-10-25 08:06:27'),
(9, '¿Cuanta Comida?', '{\"correct_result\":{\"points\":3,\"condition\":1},\"use_variable\":{\"points\":1,\"condition\":1},\"use_conditional\":{\"points\":1,\"condition\":1},\"use_loop\":{\"points\":1,\"condition\":1},\"use_function\":{\"points\":2,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:06:28', '2016-10-25 08:06:28'),
(10, 'Integrando los Módulos', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:06:31', '2016-10-25 08:06:31'),
(11, 'Calculador de Presupuesto', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-25 05:06:33', '2016-10-25 08:06:33'),
(12, 'Primera Actividad', '{\"use_variable\":{\"points\":5,\"condition\":1},\"use_loop\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-11-11 06:24:39', '2016-11-11 09:24:39'),
(13, 'Nueva Actividad', '', '', '2016-11-11 17:16:31', '2016-11-11 17:16:31'),
(14, 'Uso de matemáticas', '{\"correct_result\":{\"points\":5,\"condition\":2,\"values\":[\"25\",\"Esta sentencia es verdadera\"]}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-12-19 05:46:40', '2016-12-19 08:46:40'),
(15, 'Llegando al blanco', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-12-19 00:58:18', '2016-12-19 03:58:18'),
(16, 'Nueva Actividad', '{\"correct_result\":{\"points\":5,\"condition\":1,\"values\":[\"Hola Mundo\"]},\"use_loop\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"controls_repeat_ext\" id=\"A1R-=`aK+Z*}?;AlzH1g\" x=\"41\" y=\"-19\"><value name=\"TIMES\"><shadow type=\"math_number\" id=\"P8(/CTzYqRrulc?0@?8`\"><field name=\"NUM\">10</field></shadow></value><statement name=\"DO\"><block type=\"text_console\" id=\"zO?d)]]B`GR7@yx}{uV/\"><value name=\"CONSOLE\"><block type=\"text\" id=\"T{z]wR4,d=UaySrIh~tV\"><field name=\"TEXT\">Hola Mundo</field></block></value></block></statement></block></xml>', '2016-12-28 22:14:53', '2016-12-28 22:14:53'),
(17, 'Recapitulando mensajes', '{\"correct_result\":{\"points\":5,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"zD),`Mej*sIaw_{g[q|o\" x=\"5\" y=\"98\"><field name=\"VAR\">verso</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"ZV:quvfHA,/(Z(4wj9x#\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"al=*;2zNuhj;Dx=;`P4C\"><field name=\"TEXT\">escribe tu verso</field></shadow></value></block></value><next><block type=\"text_console\" id=\"h=Qy/*-%}qI#890#zbpm\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"3_ZdV}Z5LuOwsRfR_gr6\"><field name=\"VAR\">verso</field></block></value></block></next></block></xml>', '2017-04-10 17:54:19', '2017-04-10 17:54:19'),
(18, 'Nueva Actividad', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2017-04-10 17:54:28', '2017-04-10 17:54:28'),
(19, 'Nueva Actividad', '', '', '2017-04-10 17:54:32', '2017-04-10 17:54:32'),
(20, 'Nueva Actividad', '{\"use_conditional\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2017-04-10 17:54:57', '2017-04-10 17:54:57'),
(21, 'Nueva Actividad', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2017-04-10 17:55:05', '2017-04-10 17:55:05'),
(22, '¿Quién vendrá a comer?', '{\"correct_result\":{\"points\":5,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":5,\"condition\":2}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"Om|DK[9AWPh[pa`XP-d`\" x=\"11\" y=\"30\"><value name=\"CONSOLE\"><block type=\"text\" id=\"ux[^^,4pD5n^3086J(-f\"><field name=\"TEXT\">Hola, quien viene a comer? </field></block></value><next><block type=\"variables_set\" id=\"jyz082O:xHIQ3~Gvr8*=\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"kBMj2gYSjNXHU+tR/{7r\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"QyYLF;wq{LXv3r0d5:ir\"><field name=\"TEXT\">dime tu nombre:</field></shadow></value></block></value><next><block type=\"text_console\" id=\"bS]936c2xSeB@O}/SVYI\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"B#nd[pqbr_t*47htz#VE\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"7K2NtX5Icl;NR(=fN.oL\"><field name=\"TEXT\">Bienvenido, </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"|cqgMob6ei?uL:h,5t3Z\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-25 19:39:00', '2017-04-25 19:39:00'),
(23, '¿Cuánto pastel han comido?', '{\"correct_result\":{\"points\":5,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"nJId|IVyQwJquoU2f3aF\" x=\"-277\" y=\"-8\"><value name=\"CONSOLE\"><block type=\"text\" id=\"(xo*)X9vX_7J`:m7?EAq\"><field name=\"TEXT\">calcular total comido</field></block></value><next><block type=\"variables_set\" id=\"T~XK-SB.Xd6,yLIbXTK:\"><field name=\"VAR\">total_trozos</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"]mjL0[,@d~hd`Y5L_6ge\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"-L?Y=Q6f`3VUeDB2H|jV\"><field name=\"TEXT\">trozos totales</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"HlN4?{DBq9n/Y+ZwVVU!\"><field name=\"VAR\">trozos_1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\".CLRji(Ww4FBfIvBEy^6\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\".*p,Il]k}Am4RYk;wL~4\"><field name=\"TEXT\">trozos amigo 1</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"=%V*gN=U+u%!f#_k(]aB\"><field name=\"VAR\">trozos_2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"z~RY}CH[yWf]_UnN3Ba1\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"kc-wUq,POVr^X?-;tLLv\"><field name=\"TEXT\">trozos amigo 2</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"-sKcfU.ua,Ubrn)M+L;T\"><field name=\"VAR\">trozos_3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"U%=bStF4%zuc`Y|Dbi!@\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"R~4HM]?.QFW@l^K.tfRG\"><field name=\"TEXT\">trozos amigo 3</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"kdx77DMU0ZcJv:9YD#x2\"><field name=\"VAR\">trozos_dueño</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"IX#z8njd+{1OK4,dxKvh\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"6i0=K?!9BfNHe_Pgj(=+\"><field name=\"TEXT\">trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"z~LBan7wU2u9.)cy|1oZ\"><field name=\"VAR\">numerador</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"OYNmFVl8bw)KnI^)c5sU\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"O-yx.[~A3-SxpP@d6?X6\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"|)Korf`X_SSVUAGKW^1}\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"r?ouLs^N^y7_UvJioji!\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"z/a9V1+7dMY5o!x9yjm!\"><field name=\"VAR\">trozos_1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"h[my8k/FOs]?foE1*LXe\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\",x1cRF+kC/}+rDAld~h=\"><field name=\"VAR\">trozos_2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"s/(IRaGtl,5]`|;CdW*p\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\")6{H%}.O|+}PJ^YXH6Tb\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"9g];5kff@05[Ugt,M%Y1\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Kewk_!!UcX6o=qaxj^.Z\"><field name=\"VAR\">trozos_3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"@L?*Mh,gU8_QBh`g}i?v\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"3=r.Sq3B:KAF6/A[=1:Q\"><field name=\"VAR\">trozos_dueño</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"L1o!zfYTumF7hUc)I]Eg\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"?S]@8t~t_I9HnW%pFY-Y\"><mutation items=\"5\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"}!3LIQ+]T29cKO4^#e-.\"><field name=\"TEXT\">Han comido </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"+a%EMo;TfGzh6mK4V)Jx\"><field name=\"VAR\">numerador</field></block></value><value name=\"ADD2\"><block type=\"text\" id=\"CDUV1c[!@:7K^M9y.hK*\"><field name=\"TEXT\">/</field></block></value><value name=\"ADD3\"><block type=\"variables_get\" id=\"A{`FDL;I4Hnp-+)Dy-R2\"><field name=\"VAR\">total_trozos</field></block></value><value name=\"ADD4\"><block type=\"text\" id=\"8B?Mq:PK,I;1wd/h.zkb\"><field name=\"TEXT\"> del pastel</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-25 20:09:45', '2017-04-25 20:09:45'),
(25, '¿Cuánto comerán del pastel?', '{\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"t8d]0PoU?Yq-W5N5,8Tb\" x=\"-60\" y=\"4\"><value name=\"CONSOLE\"><block type=\"text\" id=\"CXS.%hjw9R1%thVC#{N?\"><field name=\"TEXT\">cálculo de trozos de pastel</field></block></value><next><block type=\"variables_set\" id=\"+{Q~7RjQ;|-8VxYNL;uO\"><field name=\"VAR\">trozos_1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"#Xo|d2E(T@6IUmpqiy-5\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"(SP1C/4MLG~L6?=g,KHS\"><field name=\"TEXT\">trozos amigo 1</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"z#uRI4jlcr]@T6h5%|h_\"><field name=\"VAR\">trozos_2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"0yzD{:`_jLPb7*=nzE]6\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"e-LGyPU,`)Sh4xgfFHd.\"><field name=\"TEXT\">trozos amigo 2</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"uzwA1aN]bqkP5p*gO4?#\"><field name=\"VAR\">trozos_3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"sTx1O}M)?KQI_yGJL:[9\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"50wayVKsY3AeobjS+YQ-\"><field name=\"TEXT\">trozos amigo 3</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"|No`Gdwja)=bj{*!}DcV\"><field name=\"VAR\">trozos_dueño_de_casa</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"xJK6t8+n6pMSMV^x1B=#\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"j;JB:ubRkuUb)MTcSRoN\"><field name=\"TEXT\">trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"w?7UjFdX@Ip]{2K,.F2m\"><field name=\"VAR\">total_trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"nJ,Z*;?DQBRzwUkEb:[8\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"1yHz_?ewlgpEKC]AYjb1\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"fzz~G9^@(Ji_2Z`zb]._\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"X7p,#oO{Y*z7QdJUp`#c\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"g50gsPtT~W5GUKoC3%Ti\"><field name=\"VAR\">trozos_1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\":FK9DV#}_k+NG8rb#F4@\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"@YqAaF.{0tMI~6A]c9qc\"><field name=\"VAR\">trozos_2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"M]|G~dKi^]=r)Y;9Z.Vk\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"|Wlo%_4/?_XQ_BViBz`,\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"G2!ZEu@[3z^-`(2F:[oo\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"O2R8|@r]MChAL}(|*gg3\"><field name=\"VAR\">trozos_3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\".FRuM)}oT+6Av[g9NYH=\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"XL`2lpMb0,9JFzA*9kz;\"><field name=\"VAR\">trozos_dueño_de_casa</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"dZko_ZTU4;.hrE7={/##\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"HxlA35%%cZYok.hqSa)6\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"VWJs!{eJ1napj3_NgAbl\"><field name=\"TEXT\">el total de trozos es: </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"FrP0wloV;DGuc;X-JZN(\"><field name=\"VAR\">total_trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-25 19:53:14', '2017-04-25 19:53:14'),
(26, 'No todos los pedazos son iguales...', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2017-04-25 17:55:14', '2017-04-25 17:55:14'),
(33, 'Matematica Simple', '{\"correct_result\":{\"points\":7,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":3,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"+:Ym%IDGDsq%tUSVFend\" x=\"140\" y=\"45\"><value name=\"CONSOLE\"><block type=\"text\" id=\"dAT/c?/xb8eGNCoY0dqj\"><field name=\"TEXT\">Matematicas Simples</field></block></value><next><block type=\"variables_set\" id=\"tyN|hdNbB5Ngj[JjQ1-_\"><field name=\"VAR\">X</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"9sn!v_|ubvapWY?U{y`r\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"c0T08s=L_^dE5TV!SPbi\"><field name=\"NUM\">16</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"%gq.H.A!i8w+G-54q=B^\"><field name=\"NUM\">4</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Ewxd@CDU/R7ODVY5]I@=\"><field name=\"VAR\">X</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"[WE7Y2.E/7]5wrE=6/n/\"><field name=\"OP\">DIVIDE</field><value name=\"A\"><shadow type=\"math_number\" id=\"}TrJZ/[^^vnQcU8??LHz\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"-LYpZpRSt=RDiNHrVOJR\"><field name=\"VAR\">X</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"oLxl)Q6v7zE#(*NLAi2w\"><field name=\"NUM\">5</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"d0EhHh7uWvI-}lKx:SlD\"><field name=\"VAR\">X</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"*r!6KB(NaVg0sfaByx}s\"><field name=\"OP\">MULTIPLY</field><value name=\"A\"><shadow type=\"math_number\" id=\"Rf3u.OrvI#f@bz;yc+El\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"XV8kKPCQOJMU#gFBK6)8\"><field name=\"VAR\">X</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"b+]@7dGmY%E-vb,{53fY\"><field name=\"NUM\">2.5</field></shadow></value></block></value><next><block type=\"text_console\" id=\"-=aPb#IN7}7H(w,iC(yo\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"1K?kSyx0*lZA7F@i2=Le\"><field name=\"VAR\">X</field></block></value></block></next></block></next></block></next></block></next></block></xml>', '2017-05-25 20:12:20', '2017-05-25 20:12:20'),
(35, 'Crea tu primer programa', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"A?oO(;o(C)z[^241wt*H\" x=\"124\" y=\"-43\"><value name=\"CONSOLE\"><block type=\"text\" id=\"9.T.pELi9*V8ztA8qp*l\"><field name=\"TEXT\">Hola mundo</field></block></value></block></xml>', '2017-05-26 00:53:48', '2017-05-26 00:53:48'),
(36, 'Generando Texto', '{\"use_variable\":{\"points\":5,\"condition\":1},\"use_loop\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"x2V;DR]^YpPMb.CYmvbs\" x=\"4\" y=\"-108\"><field name=\"VAR\">X</field><next><block type=\"controls_repeat_ext\" id=\"~9j}Oh0YP:tGWi`Il}Ml\"><value name=\"TIMES\"><shadow type=\"math_number\" id=\"gM@gU2==i-FtG2%k~YeN\"><field name=\"NUM\">4</field></shadow></value><statement name=\"DO\"><block type=\"text_append\" id=\"GXtnGi*:6H#Ya4[Z{5lU\"><field name=\"VAR\">X</field><value name=\"TEXT\"><shadow type=\"text\" id=\"PUraRR[LjVslG*ZP8~0B\"><field name=\"TEXT\">.Bien y tu?</field></shadow><block type=\"text_prompt_ext\" id=\"S8hnJ)l%C`sokTzZXe`g\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Ny!t%-M{;/?k`i[:;B}6\"><field name=\"TEXT\">Historia</field></shadow></value></block></value><next><block type=\"text_console\" id=\"nC7@fG,D.6dQ0_OupCwJ\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"l9fwiK7W4]XRH:#!rQ1.\"><field name=\"VAR\">X</field></block></value></block></next></block></statement></block></next></block></xml>', '2017-05-26 00:49:20', '2017-05-26 00:49:20'),
(39, 'Corazón', '{\"use_variable\":{\"points\":5,\"condition\":2},\"use_conditional\":{\"points\":5,\"condition\":2},\"use_loop\":{\"points\":5,\"condition\":2}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block id=\"?/IQA17por~N*pQe=8).\" type=\"variables_set\" x=\"138\" y=\"63\"><field name=\"VAR\">corazón</field><value name=\"VALUE\"><block id=\"6T?Rtw`cq7tTb[+z*H*9\" type=\"logic_boolean\"><field name=\"BOOL\">TRUE</field></block></value><next><block id=\"~=d[tS~-UH~|i7x4^Ba=\" type=\"controls_whileUntil\"><field name=\"MODE\">WHILE</field><value name=\"BOOL\"><block id=\"2WQ9#JLacU+d#}SEy2rl\" type=\"logic_boolean\"><field name=\"BOOL\">TRUE</field></block></value><statement name=\"DO\"><block id=\"l{21jpEP|rbI{gwj!-xZ\" type=\"text_console\"><value name=\"CONSOLE\"><block id=\"IqodgGIlzfWO{Oo.0aUU\" type=\"text\"><field name=\"TEXT\">Corazón esta latiendo</field></block></value><next><block id=\"(yig{JdgP-]Kc14L7E}u\" type=\"controls_if\"><value name=\"IF0\"><block id=\"c%KP}@2/9-R0-R;X*bHg\" type=\"logic_boolean\"><field name=\"BOOL\">FALSE</field></block></value><statement name=\"DO0\"><block id=\"[3)0(r-B{9tyb!|H%540\" type=\"controls_flow_statements\"><field name=\"FLOW\">BREAK</field></block></statement></block></next></block></statement></block></next></block></xml>', '2017-06-05 17:57:30', '2017-06-05 17:57:30'),
(44, 'Calculadora', '{\"correct_result\":{\"points\":5,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"o6a`q[WYzgV:n2@H%|6)\" x=\"-24\" y=\"3\"><field name=\"VAR\">opcion</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"LvUijiUMM)_B#52S1DEI\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"`:LHZ*%pigytUhRbp2(Y\"><field name=\"TEXT\">Elija la operacion que desea ralizar</field></shadow></value></block></value><next><block type=\"text_console\" id=\"ZNSqmLpeynokM/c1f(zT\"><value name=\"CONSOLE\"><block type=\"text\" id=\"MnZc^h~,aZNh?R2s/MmL\"><field name=\"TEXT\">+</field></block></value><next><block type=\"text_console\" id=\"qT2H}y07#:C-yY5/RRLg\"><value name=\"CONSOLE\"><block type=\"text\" id=\"-9;#?i!v!GO1{Y/kxuS9\"><field name=\"TEXT\">-</field></block></value><next><block type=\"text_console\" id=\"tI1j8yZXSiTUy`s9r9R2\"><value name=\"CONSOLE\"><block type=\"text\" id=\"Ve}@3smI8S?3tkuKS_fo\"><field name=\"TEXT\">*</field></block></value><next><block type=\"text_console\" id=\"IscPU5HV)XjX/L~Sg|h%\"><value name=\"CONSOLE\"><block type=\"text\" id=\"2=/|Y|mC4@@RMm5:9Bkk\"><field name=\"TEXT\">/</field></block></value><next><block type=\"variables_set\" id=\"#Kjks}o_^|h;hjJpYnf{\"><field name=\"VAR\">NumeroA</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"iD{KK)hyO0I%Ug,w3tx0\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"-g3%{L13=O(}aRZGu+Yj\"><field name=\"TEXT\">Teclea un numero</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"pTfEwM=imvp_0t//t[nN\"><field name=\"VAR\">NumeroB</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"CsD6_%%{J(.Zgnsy%o]8\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"-w7qW;{IiBI^+T%S}ds=\"><field name=\"TEXT\">Teclea un numero</field></shadow></value></block></value><next><block type=\"controls_if\" id=\"1(hWU3Cb:Z7`,R`N](ya\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"+e]qU62/zc)?}dKMfnY.\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"variables_get\" id=\"kXsRUQgTnq=bb)9[D%za\"><field name=\"VAR\">opcion</field></block></value><value name=\"B\"><block type=\"text\" id=\"Ui(YCve!6X7D7sIYP*JY\"><field name=\"TEXT\">+</field></block></value></block></value><statement name=\"DO0\"><block type=\"variables_set\" id=\"IDf;xb5qx.TdUy~C6TAu\"><field name=\"VAR\">Resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"_IB6?Xsx@@Lza4?=6i=o\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"j=QWba5kfL0AMjq2h=d,\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"58,9/I^Pi+%^T~c4CuUp\"><field name=\"VAR\">NumeroA</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"/FwfnX@HY-:=K86f|qNo\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"EQQM+So~*6?i-45HuNZ(\"><field name=\"VAR\">NumeroB</field></block></value></block></value></block></statement><next><block type=\"controls_if\" id=\"S81A[88di8kFpAoOCE!g\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"9FX)O(2`)F6eft4*7{:A\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"variables_get\" id=\"[motF0)CvGj|+yAgRz}d\"><field name=\"VAR\">opcion</field></block></value><value name=\"B\"><block type=\"text\" id=\"BT-,,Gs(-8~R?0GVm9)p\"><field name=\"TEXT\">+</field></block></value></block></value><statement name=\"DO0\"><block type=\"variables_set\" id=\"C0?G+Jy}hqi.4ae|=R-2\"><field name=\"VAR\">Resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"`-U(BGF9!{p3Ko*ojr}t\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"j=QWba5kfL0AMjq2h=d,\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"L_O@itT8F7U~#Wn6crX:\"><field name=\"VAR\">NumeroA</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"/FwfnX@HY-:=K86f|qNo\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"-.%6b+ri9ZiJGMWP-m+2\"><field name=\"VAR\">NumeroB</field></block></value></block></value></block></statement></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-05-30 23:41:00', '2017-05-30 23:41:00'),
(45, 'Generar un objeto', '{\"use_variable\":{\"points\":6,\"condition\":1},\"use_conditional\":{\"points\":6,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"itx@wml4bTWYdG@uwOx3\" x=\"-13\" y=\"-151\"><field name=\"VAR\">Alto</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"_H;/@6a31%K4HGFd5]DI\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"6E0~BxH%HvL=c)4!)9|a\"><field name=\"TEXT\">Ingrese alto del objeto. (cm)</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"sFRWe*;@fmM%/t,HR0JK\"><field name=\"VAR\">Ancho</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"QxG{(E^n/%`h5kz8NHKi\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"nxsUDN?k[6PSbnDl:s=?\"><field name=\"TEXT\">Ingrese ancho del objeto. (cm)</field></shadow></value></block></value><next><block type=\"text_append\" id=\"`8hiQe[6C~X,[5gPTsvk\"><field name=\"VAR\">Alto</field><value name=\"TEXT\"><shadow type=\"text\" id=\".nHYty,BHEJtDw7C//?i\"><field name=\"TEXT\"> cm.</field></shadow></value><next><block type=\"text_append\" id=\"*J4%gjz,Taf=5ms-?jT[\"><field name=\"VAR\">Ancho</field><value name=\"TEXT\"><shadow type=\"text\" id=\"aC4N#edz@,M[FT8;=1Li\"><field name=\"TEXT\"> cm.</field></shadow></value><next><block type=\"text_console\" id=\"rrht(4#)~+onM;d`0tV~\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"Ir7rp)m:SW6rm23s!77a\"><field name=\"VAR\">Alto</field></block></value><next><block type=\"text_console\" id=\"f-aQUuj9/7#;?|KpFOIN\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"PZT`j-=C;H/th6U_X_yC\"><field name=\"VAR\">Ancho</field></block></value><next><block type=\"controls_if\" id=\"#(T]J9o?%AO@/s]M?9hX\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"{Lmpaf5kqvcB-5Rb{zP5\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"variables_get\" id=\"m}O7HtXd/=h`!:e~64Dc\"><field name=\"VAR\">Alto</field></block></value><value name=\"B\"><block type=\"variables_get\" id=\"=7wL(|iKG5YXGBkmMw7H\"><field name=\"VAR\">Ancho</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"!]]S~63`2l7rjSltj~aQ\"><value name=\"CONSOLE\"><block type=\"text\" id=\"d]RBy*hUb((3H=:~:n*L\"><field name=\"TEXT\">El objeto en un cuadrado.</field></block></value></block></statement><next><block type=\"controls_if\" id=\"3*Z|kX+Qj}.BQl#1m_l2\"><value name=\"IF0\"><block type=\"logic_compare\" id=\",u808,;L%mGbFp+sC@bW\"><field name=\"OP\">NEQ</field><value name=\"A\"><block type=\"variables_get\" id=\"_%a@O(uhuyDQ5,y=6:7,\"><field name=\"VAR\">Alto</field></block></value><value name=\"B\"><block type=\"variables_get\" id=\"JF/^adD#2]VCMaB@A)R-\"><field name=\"VAR\">Ancho</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"Yx9_)7V;zq.0ss^j)82]\"><value name=\"CONSOLE\"><block type=\"text\" id=\",hMMZ^G+1I.%PXHhtH`Z\"><field name=\"TEXT\">El objeto en un rectangulo.</field></block></value></block></statement></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-07-04 00:42:11', '2017-07-04 00:42:11'),
(47, 'Escoge tu problema', '{\"correct_result\":{\"points\":5,\"condition\":1,\"values\":[]},\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"0TPk;b%.4s3%P[7W6}Ay\" x=\"-166\" y=\"-15\"><field name=\"VAR\">problema</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"KjR:(,G9GAK1|:9^%1b+\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"s#^W:#j39MKe5Cvh;LC}\"><field name=\"TEXT\">escribe el problema</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"0thn#`X-P,CKi5g(+o75\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"g|y*p@f)81mp9bg,j8zv\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"1lCWLxKdQTwp(4E+%@=n\"><field name=\"TEXT\">escribe tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"6v`21cS+L.sT#B(@:vD+\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"XO3q?7qA,mJ|=:!7zFMP\"><mutation items=\"3\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"vcdz~D@Y8JoV9Lxe1f@l\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"c+G?bxYBoHWGs@!Kq:K#\"><field name=\"TEXT\"> propone como problema: </field></block></value><value name=\"ADD2\"><block type=\"variables_get\" id=\"5:@+@qytJWmizVi,P2Kl\"><field name=\"VAR\">problema</field></block></value></block></value></block></next></block></next></block></xml>', '2017-07-06 19:09:47', '2017-07-06 19:09:47'),
(48, 'Estructura de la noticia', '{\"use_variable\":{\"points\":5,\"condition\":1}}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"2yFpP+nV.N%ef_4#OP[#\" x=\"-268\" y=\"-39\"><field name=\"VAR\">que</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"RLU^Z`;)V{~:5Vg;:,3m\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"[tmb)u[zoW(v5EO(!|gt\"><field name=\"TEXT\">escribe el qué</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"h`NDCxZt[*V#e1ET{f~1\"><field name=\"VAR\">quien</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"aop;/lc%^jz7OAf9-hgP\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"B4h=KQB`=x!|!`vl:pzr\"><field name=\"TEXT\">escribe el quién</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"j|~#^O/XwV2vZy69K-^+\"><field name=\"VAR\">cuando</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"S?0t)OIirCh1[T[]OpC/\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"z~7IC|NBMJggasf];2ai\"><field name=\"TEXT\">escribe el cuándo</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"fX,HB`I{~R7#Fh;-_#*i\"><field name=\"VAR\">donde</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"e/Dbw@7]Cm`Y^c+rap:o\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"g`%j,qcQpekD5)KskP^v\"><field name=\"TEXT\">escribe el dónde</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"xYg:X#,IdX#JCM7uic,f\"><field name=\"VAR\">como</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"ep4nV-(qxje7s[Yi#r)/\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"ccM8vzI!bf(yOu`pQ=HA\"><field name=\"TEXT\">escribe el cómo</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"0Rx8Myi8Ok0P4tZ1!g[O\"><field name=\"VAR\">porque</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"rSFumg~B-kCr:oEP.BNi\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"xm:Q|sN=w0X~INjbm}%A\"><field name=\"TEXT\">escribe el por qué</field></shadow></value></block></value><next><block type=\"text_console\" id=\"mXa,bIbZ-/SXLgSn2@?Y\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"nff|?|JU:g0f[{@-KY/f\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"Enjq)T%3*jE@N~0ccEDM\"><field name=\"TEXT\">Lo que ocurrió fue...</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"C-6FUsNd.0AtxFlhs-uq\"><field name=\"VAR\">que</field></block></value></block></value><next><block type=\"text_console\" id=\".n![[E,f9F_HDDSL6S{V\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"Lm@)j1xd)x]M^TVX4xc?\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"P%d31A8H_l?:;htEr9pV\"><field name=\"TEXT\">Los involucrados fueron...</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"XF*7t;!+6|+p~Rn~Rprk\"><field name=\"VAR\">quien</field></block></value></block></value><next><block type=\"text_console\" id=\"a9omp{FH.7k9^1/0xV)e\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"NcjTI#]N5*jGOiGLLPNP\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"bmX?pyMskvYv{3`(U+J^\"><field name=\"TEXT\">Esto ocurrió...</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"*{//m)@X1%fMTXa!2jwI\"><field name=\"VAR\">cuando</field></block></value></block></value><next><block type=\"text_console\" id=\"[ls+fkrTHB|hOi`Ko!F,\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"R`j]YUl;oS2)/++hRvUf\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\";WDj~YnL2[DM:!:I4r0L\"><field name=\"TEXT\">En el lugar...</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\":]m{1q+K+s!%9KcC{E.#\"><field name=\"VAR\">donde</field></block></value></block></value><next><block type=\"text_console\" id=\"(cnB0Aq48@o%x9.P)aJ.\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"9EvrKZRkTg8,r9kI54R0\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"4HwAX]NB}Hz-.cHVF;i?\"><field name=\"TEXT\">La manera en que ocurrió  fue...</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"]7N{4#(0SHuej?KGiAr4\"><field name=\"VAR\">como</field></block></value></block></value><next><block type=\"text_console\" id=\"}8#Cc,=fL.oi11XvdnpW\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"RWs)Wc]a9@)nKbBdoPxW\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"_l|2!KjbvFV(W%4GRJ*u\"><field name=\"TEXT\">Ello ocurrió porque...</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"pPR];*3]D:f~Z/CP)fgz\"><field name=\"VAR\">porque</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-07-06 19:17:24', '2017-07-06 19:17:24'),
(49, 'Nueva Actividad', '', '', '2020-09-22 02:49:44', '2020-09-22 02:49:44'),
(50, 'Nueva Actividad', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2020-09-22 03:15:43', '2020-09-22 06:15:43'),
(51, 'Nueva Actividad', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2020-09-22 03:15:48', '2020-09-22 06:15:48'),
(52, 'Nueva Actividad', '', '', '2020-09-22 22:38:09', '2020-09-22 22:38:09'),
(53, 'Nueva Actividad', '', '', '2020-09-23 02:20:24', '2020-09-23 02:20:24'),
(54, 'Nueva Actividad', '{}', '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2020-09-23 02:29:39', '2020-09-23 05:29:39'),
(55, 'Nueva Actividad', '', '', '2020-09-23 05:50:15', '2020-09-23 05:50:15'),
(56, 'Nueva Actividad', '', '', '2020-09-23 06:47:12', '2020-09-23 06:47:12'),
(57, 'Nueva Actividad', '', '', '2020-09-23 06:47:13', '2020-09-23 06:47:13'),
(58, 'Nueva Actividad', '', '', '2020-09-23 06:47:13', '2020-09-23 06:47:13'),
(59, 'Nueva Actividad', '', '', '2020-09-23 06:47:14', '2020-09-23 06:47:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities_groups`
--

CREATE TABLE `activities_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `problem_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `activities_groups`
--

INSERT INTO `activities_groups` (`id`, `problem_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Conceptos Clave', '2016-12-28 22:11:35', '2016-12-28 22:11:35'),
(2, 1, 'Solucionando el Problema', '2016-11-11 02:14:34', '2016-10-25 07:25:52'),
(3, 1, 'Integración de Solución', '2016-11-11 02:14:38', '2016-10-25 07:26:03'),
(4, 1, 'Reflexionando lo Aprendido', '2016-11-11 02:14:40', '2016-10-25 07:26:12'),
(5, 3, 'Actividades de Activación', '2016-11-11 06:24:59', '2016-11-11 09:24:59'),
(6, 3, 'Elaboración :D', '2016-11-11 14:16:29', '2016-11-11 17:16:29'),
(7, 3, 'Consolidación', '2016-11-11 09:12:36', '2016-11-11 09:12:36'),
(8, 3, 'Reflexión', '2016-11-11 09:12:36', '2016-11-11 09:12:36'),
(9, 4, 'Activación', '2016-11-11 17:12:02', '2016-11-11 17:12:02'),
(10, 4, 'Elaboración', '2016-11-11 17:12:02', '2016-11-11 17:12:02'),
(11, 4, 'Consolidación', '2016-11-11 17:12:02', '2016-11-11 17:12:02'),
(12, 4, 'Reflexión', '2016-11-11 17:12:02', '2016-11-11 17:12:02'),
(13, 5, 'Activación', '2016-11-16 09:31:32', '2016-11-16 09:31:32'),
(14, 5, 'Elaboración', '2016-11-16 09:31:32', '2016-11-16 09:31:32'),
(15, 5, 'Consolidación', '2016-11-16 09:31:32', '2016-11-16 09:31:32'),
(16, 5, 'Reflexión', '2016-11-16 09:31:32', '2016-11-16 09:31:32'),
(17, 6, 'Activación', '2016-12-06 04:58:43', '2016-12-06 04:58:43'),
(18, 6, 'Elaboración', '2016-12-06 04:58:43', '2016-12-06 04:58:43'),
(19, 6, 'Consolidación', '2016-12-06 04:58:43', '2016-12-06 04:58:43'),
(20, 6, 'Reflexión', '2016-12-06 04:58:43', '2016-12-06 04:58:43'),
(21, 7, 'Conceptos Básicos', '2016-12-19 00:13:35', '2016-12-19 03:13:35'),
(22, 7, 'Elaboración', '2016-12-15 04:45:05', '2016-12-15 04:45:05'),
(23, 7, 'Consolidación', '2016-12-15 04:45:06', '2016-12-15 04:45:06'),
(24, 7, 'Reflexión', '2016-12-15 04:45:06', '2016-12-15 04:45:06'),
(25, 8, 'Activación', '2017-04-10 17:48:14', '2017-04-10 17:48:14'),
(26, 8, 'Elaboración', '2017-04-10 17:48:14', '2017-04-10 17:48:14'),
(27, 8, 'Consolidación', '2017-04-10 17:48:14', '2017-04-10 17:48:14'),
(28, 8, 'Reflexión', '2017-04-10 17:48:14', '2017-04-10 17:48:14'),
(29, 9, 'Activación', '2018-12-20 18:50:15', '2018-12-20 18:50:15'),
(30, 9, 'Elaboración', '2017-04-25 17:40:31', '2017-04-25 17:40:31'),
(31, 9, 'Consolidación', '2017-04-25 17:40:31', '2017-04-25 17:40:31'),
(32, 9, 'Reflexión', '2017-04-25 17:40:31', '2017-04-25 17:40:31'),
(33, 10, 'Para empezar', '2017-05-25 01:43:11', '2017-05-25 01:43:11'),
(34, 10, 'Continuando', '2017-05-25 20:14:48', '2017-05-25 20:14:48'),
(35, 10, 'Complicando las cosas', '2017-07-03 23:56:17', '2017-07-03 23:56:17'),
(36, 10, 'Reflexión', '2017-05-25 01:27:26', '2017-05-25 01:27:26'),
(37, 11, 'Primer programa', '2017-05-25 01:31:35', '2017-05-25 01:31:35'),
(38, 11, 'Elaboración', '2017-05-25 01:28:05', '2017-05-25 01:28:05'),
(39, 11, 'Consolidación', '2017-05-25 01:28:05', '2017-05-25 01:28:05'),
(40, 11, 'Reflexión', '2017-05-25 01:28:05', '2017-05-25 01:28:05'),
(41, 12, 'Activación', '2017-05-30 22:42:50', '2017-05-30 22:42:50'),
(42, 12, 'Elaboración', '2017-05-30 22:42:50', '2017-05-30 22:42:50'),
(43, 12, 'Consolidación', '2017-05-30 22:42:50', '2017-05-30 22:42:50'),
(44, 12, 'Reflexión', '2017-05-30 22:42:50', '2017-05-30 22:42:50'),
(45, 13, 'Activación', '2017-05-30 22:50:33', '2017-05-30 22:50:33'),
(46, 13, 'Elaboración', '2017-05-30 22:50:33', '2017-05-30 22:50:33'),
(47, 13, 'Consolidación', '2017-05-30 22:50:33', '2017-05-30 22:50:33'),
(48, 13, 'Reflexión', '2017-05-30 22:50:33', '2017-05-30 22:50:33'),
(49, 14, 'Tarea inicial', '2017-07-06 18:59:48', '2017-07-06 18:59:48'),
(50, 14, 'Planificación de la noticia', '2017-07-06 19:10:05', '2017-07-06 19:10:05'),
(51, 14, 'Consolidación', '2017-07-06 18:58:54', '2017-07-06 18:58:54'),
(52, 14, 'Reflexión', '2017-07-06 18:58:54', '2017-07-06 18:58:54'),
(53, 15, 'Activación', '2020-09-22 02:49:41', '2020-09-22 02:49:41'),
(54, 15, 'Elaboración', '2020-09-22 02:49:41', '2020-09-22 02:49:41'),
(55, 15, 'Consolidación', '2020-09-22 02:49:41', '2020-09-22 02:49:41'),
(56, 15, 'Reflexión', '2020-09-22 02:49:41', '2020-09-22 02:49:41'),
(57, 16, 'Activación', '2020-09-22 06:46:35', '2020-09-22 06:46:35'),
(58, 16, 'Elaboración', '2020-09-22 06:46:35', '2020-09-22 06:46:35'),
(59, 16, 'Consolidación', '2020-09-22 06:46:35', '2020-09-22 06:46:35'),
(60, 16, 'Reflexión', '2020-09-22 06:46:35', '2020-09-22 06:46:35'),
(61, 17, 'Activación', '2020-09-22 06:48:16', '2020-09-22 06:48:16'),
(62, 17, 'Elaboración', '2020-09-22 06:48:16', '2020-09-22 06:48:16'),
(63, 17, 'Consolidación', '2020-09-22 06:48:16', '2020-09-22 06:48:16'),
(64, 17, 'Reflexión', '2020-09-22 06:48:16', '2020-09-22 06:48:16'),
(65, 18, 'Activación', '2020-09-22 23:37:29', '2020-09-22 23:37:29'),
(66, 18, 'Elaboración', '2020-09-22 23:37:29', '2020-09-22 23:37:29'),
(67, 18, 'Consolidación', '2020-09-22 23:37:29', '2020-09-22 23:37:29'),
(68, 18, 'Reflexión', '2020-09-22 23:37:29', '2020-09-22 23:37:29'),
(69, 19, 'Activación', '2020-09-22 23:48:08', '2020-09-22 23:48:08'),
(70, 19, 'Elaboración', '2020-09-22 23:48:08', '2020-09-22 23:48:08'),
(71, 19, 'Consolidación', '2020-09-22 23:48:08', '2020-09-22 23:48:08'),
(72, 19, 'Reflexión', '2020-09-22 23:48:08', '2020-09-22 23:48:08'),
(73, 20, 'Activación', '2020-09-23 00:06:23', '2020-09-23 00:06:23'),
(74, 20, 'Elaboración', '2020-09-23 00:06:23', '2020-09-23 00:06:23'),
(75, 20, 'Consolidación', '2020-09-23 00:06:23', '2020-09-23 00:06:23'),
(76, 20, 'Reflexión', '2020-09-23 00:06:23', '2020-09-23 00:06:23'),
(77, 21, 'Activación', '2020-09-23 00:13:43', '2020-09-23 00:13:43'),
(78, 21, 'Elaboración', '2020-09-23 00:13:44', '2020-09-23 00:13:44'),
(79, 21, 'Consolidación', '2020-09-23 00:13:44', '2020-09-23 00:13:44'),
(80, 21, 'Reflexión', '2020-09-23 00:13:44', '2020-09-23 00:13:44'),
(81, 22, 'Activación', '2020-09-23 00:15:28', '2020-09-23 00:15:28'),
(82, 22, 'Elaboración', '2020-09-23 00:15:28', '2020-09-23 00:15:28'),
(83, 22, 'Consolidación', '2020-09-23 00:15:28', '2020-09-23 00:15:28'),
(84, 22, 'Reflexión', '2020-09-23 00:15:28', '2020-09-23 00:15:28'),
(85, 23, 'Activación', '2020-09-23 00:16:24', '2020-09-23 00:16:24'),
(86, 23, 'Elaboración', '2020-09-23 00:16:24', '2020-09-23 00:16:24'),
(87, 23, 'Consolidación', '2020-09-23 00:16:24', '2020-09-23 00:16:24'),
(88, 23, 'Reflexión', '2020-09-23 00:16:24', '2020-09-23 00:16:24'),
(89, 24, 'Activación', '2020-09-23 00:50:15', '2020-09-23 00:50:15'),
(90, 24, 'Elaboración', '2020-09-23 00:50:15', '2020-09-23 00:50:15'),
(91, 24, 'Consolidación', '2020-09-23 00:50:15', '2020-09-23 00:50:15'),
(92, 24, 'Reflexión', '2020-09-23 00:50:15', '2020-09-23 00:50:15'),
(93, 25, 'Activación', '2020-09-23 01:16:14', '2020-09-23 01:16:14'),
(94, 25, 'Elaboración', '2020-09-23 01:16:14', '2020-09-23 01:16:14'),
(95, 25, 'Consolidación', '2020-09-23 01:16:14', '2020-09-23 01:16:14'),
(96, 25, 'Reflexión', '2020-09-23 01:16:14', '2020-09-23 01:16:14'),
(97, 26, 'Activación', '2020-09-23 01:50:33', '2020-09-23 01:50:33'),
(98, 26, 'Elaboración', '2020-09-23 01:50:33', '2020-09-23 01:50:33'),
(99, 26, 'Consolidación', '2020-09-23 01:50:33', '2020-09-23 01:50:33'),
(100, 26, 'Reflexión', '2020-09-23 01:50:33', '2020-09-23 01:50:33'),
(101, 27, 'Activación', '2020-09-23 01:52:02', '2020-09-23 01:52:02'),
(102, 27, 'Elaboración', '2020-09-23 01:52:02', '2020-09-23 01:52:02'),
(103, 27, 'Consolidación', '2020-09-23 01:52:02', '2020-09-23 01:52:02'),
(104, 27, 'Reflexión', '2020-09-23 01:52:02', '2020-09-23 01:52:02'),
(105, 28, 'Activación', '2020-09-23 01:55:05', '2020-09-23 01:55:05'),
(106, 28, 'Elaboración', '2020-09-23 01:55:05', '2020-09-23 01:55:05'),
(107, 28, 'Consolidación', '2020-09-23 01:55:05', '2020-09-23 01:55:05'),
(108, 28, 'Reflexión', '2020-09-23 01:55:05', '2020-09-23 01:55:05'),
(109, 29, 'Activación', '2020-09-23 01:55:34', '2020-09-23 01:55:34'),
(110, 29, 'Elaboración', '2020-09-23 01:55:34', '2020-09-23 01:55:34'),
(111, 29, 'Consolidación', '2020-09-23 01:55:35', '2020-09-23 01:55:35'),
(112, 29, 'Reflexión', '2020-09-23 01:55:35', '2020-09-23 01:55:35'),
(113, 30, 'Activación', '2020-09-23 01:58:04', '2020-09-23 01:58:04'),
(114, 30, 'Elaboración', '2020-09-23 01:58:04', '2020-09-23 01:58:04'),
(115, 30, 'Consolidación', '2020-09-23 01:58:04', '2020-09-23 01:58:04'),
(116, 30, 'Reflexión', '2020-09-23 01:58:04', '2020-09-23 01:58:04'),
(117, 31, 'Activación', '2020-09-23 02:08:14', '2020-09-23 02:08:14'),
(118, 31, 'Elaboración', '2020-09-23 02:08:14', '2020-09-23 02:08:14'),
(119, 31, 'Consolidación', '2020-09-23 02:08:14', '2020-09-23 02:08:14'),
(120, 31, 'Reflexión', '2020-09-23 02:08:14', '2020-09-23 02:08:14'),
(121, 32, 'Activación', '2020-09-23 02:18:53', '2020-09-23 02:18:53'),
(122, 32, 'Elaboración', '2020-09-23 02:18:53', '2020-09-23 02:18:53'),
(123, 32, 'Consolidación', '2020-09-23 02:18:53', '2020-09-23 02:18:53'),
(124, 32, 'Reflexión', '2020-09-23 02:18:53', '2020-09-23 02:18:53'),
(125, 33, 'Activación', '2020-09-23 04:25:00', '2020-09-23 04:25:00'),
(126, 33, 'Elaboración', '2020-09-23 04:25:00', '2020-09-23 04:25:00'),
(127, 33, 'Consolidación', '2020-09-23 04:25:00', '2020-09-23 04:25:00'),
(128, 33, 'Reflexión', '2020-09-23 04:25:00', '2020-09-23 04:25:00'),
(129, 38, 'Activación', '2020-09-23 05:10:02', '2020-09-23 05:10:02'),
(130, 38, 'Elaboración', '2020-09-23 05:10:02', '2020-09-23 05:10:02'),
(131, 38, 'Consolidación', '2020-09-23 05:10:02', '2020-09-23 05:10:02'),
(132, 38, 'Reflexión', '2020-09-23 05:10:02', '2020-09-23 05:10:02'),
(133, 39, 'Activación', '2020-09-23 05:10:08', '2020-09-23 05:10:08'),
(134, 39, 'Elaboración', '2020-09-23 05:10:08', '2020-09-23 05:10:08'),
(135, 39, 'Consolidación', '2020-09-23 05:10:08', '2020-09-23 05:10:08'),
(136, 39, 'Reflexión', '2020-09-23 05:10:08', '2020-09-23 05:10:08'),
(137, 40, 'Activación', '2020-09-23 05:29:50', '2020-09-23 05:29:50'),
(138, 40, 'Elaboración', '2020-09-23 05:29:50', '2020-09-23 05:29:50'),
(139, 40, 'Consolidación', '2020-09-23 05:29:50', '2020-09-23 05:29:50'),
(140, 40, 'Reflexión', '2020-09-23 05:29:50', '2020-09-23 05:29:50'),
(141, 41, 'Activación', '2020-09-23 05:45:49', '2020-09-23 05:45:49'),
(142, 41, 'Elaboración', '2020-09-23 05:45:49', '2020-09-23 05:45:49'),
(143, 41, 'Consolidación', '2020-09-23 05:45:49', '2020-09-23 05:45:49'),
(144, 41, 'Reflexión', '2020-09-23 05:45:49', '2020-09-23 05:45:49'),
(145, 42, 'Activación', '2020-09-23 05:47:30', '2020-09-23 05:47:30'),
(146, 42, 'Elaboración', '2020-09-23 05:47:30', '2020-09-23 05:47:30'),
(147, 42, 'Consolidación', '2020-09-23 05:47:30', '2020-09-23 05:47:30'),
(148, 42, 'Reflexión', '2020-09-23 05:47:31', '2020-09-23 05:47:31'),
(149, 43, 'Activación', '2020-09-23 05:51:04', '2020-09-23 05:51:04'),
(150, 43, 'Elaboración', '2020-09-23 05:51:04', '2020-09-23 05:51:04'),
(151, 43, 'Consolidación', '2020-09-23 05:51:04', '2020-09-23 05:51:04'),
(152, 43, 'Reflexión', '2020-09-23 05:51:04', '2020-09-23 05:51:04'),
(153, 44, 'Activación', '2020-09-23 05:53:59', '2020-09-23 05:53:59'),
(154, 44, 'Elaboración', '2020-09-23 05:53:59', '2020-09-23 05:53:59'),
(155, 44, 'Consolidación', '2020-09-23 05:53:59', '2020-09-23 05:53:59'),
(156, 44, 'Reflexión', '2020-09-23 05:53:59', '2020-09-23 05:53:59'),
(157, 45, 'Activación', '2020-09-23 06:09:36', '2020-09-23 06:09:36'),
(158, 45, 'Elaboración', '2020-09-23 06:09:36', '2020-09-23 06:09:36'),
(159, 45, 'Consolidación', '2020-09-23 06:09:36', '2020-09-23 06:09:36'),
(160, 45, 'Reflexión', '2020-09-23 06:09:36', '2020-09-23 06:09:36'),
(161, 46, 'Activación', '2020-09-23 06:15:28', '2020-09-23 06:15:28'),
(162, 46, 'Elaboración', '2020-09-23 06:15:28', '2020-09-23 06:15:28'),
(163, 46, 'Consolidación', '2020-09-23 06:15:28', '2020-09-23 06:15:28'),
(164, 46, 'Reflexión', '2020-09-23 06:15:28', '2020-09-23 06:15:28'),
(165, 47, 'Activación', '2020-09-23 06:53:20', '2020-09-23 06:53:20'),
(166, 47, 'Elaboración', '2020-09-23 06:53:21', '2020-09-23 06:53:21'),
(167, 47, 'Consolidación', '2020-09-23 06:53:21', '2020-09-23 06:53:21'),
(168, 47, 'Reflexión', '2020-09-23 06:53:21', '2020-09-23 06:53:21'),
(169, 48, 'Activación', '2020-09-23 07:06:11', '2020-09-23 07:06:11'),
(170, 48, 'Elaboración', '2020-09-23 07:06:11', '2020-09-23 07:06:11'),
(171, 48, 'Consolidación', '2020-09-23 07:06:11', '2020-09-23 07:06:11'),
(172, 48, 'Reflexión', '2020-09-23 07:06:11', '2020-09-23 07:06:11'),
(173, 49, 'Activación', '2020-09-23 07:29:51', '2020-09-23 07:29:51'),
(174, 49, 'Elaboración', '2020-09-23 07:29:51', '2020-09-23 07:29:51'),
(175, 49, 'Consolidación', '2020-09-23 07:29:51', '2020-09-23 07:29:51'),
(176, 49, 'Reflexión', '2020-09-23 07:29:51', '2020-09-23 07:29:51'),
(177, 50, 'Activación', '2020-09-23 07:31:56', '2020-09-23 07:31:56'),
(178, 50, 'Elaboración', '2020-09-23 07:31:56', '2020-09-23 07:31:56'),
(179, 50, 'Consolidación', '2020-09-23 07:31:56', '2020-09-23 07:31:56'),
(180, 50, 'Reflexión', '2020-09-23 07:31:56', '2020-09-23 07:31:56'),
(181, 51, 'Activación', '2020-09-23 07:59:23', '2020-09-23 07:59:23'),
(182, 51, 'Elaboración', '2020-09-23 07:59:23', '2020-09-23 07:59:23'),
(183, 51, 'Consolidación', '2020-09-23 07:59:23', '2020-09-23 07:59:23'),
(184, 51, 'Reflexión', '2020-09-23 07:59:23', '2020-09-23 07:59:23'),
(185, 52, 'Activación', '2020-09-23 08:00:08', '2020-09-23 08:00:08'),
(186, 52, 'Elaboración', '2020-09-23 08:00:08', '2020-09-23 08:00:08'),
(187, 52, 'Consolidación', '2020-09-23 08:00:08', '2020-09-23 08:00:08'),
(188, 52, 'Reflexión', '2020-09-23 08:00:08', '2020-09-23 08:00:08'),
(189, 53, 'Activación', '2020-09-23 08:04:41', '2020-09-23 08:04:41'),
(190, 53, 'Elaboración', '2020-09-23 08:04:41', '2020-09-23 08:04:41'),
(191, 53, 'Consolidación', '2020-09-23 08:04:41', '2020-09-23 08:04:41'),
(192, 53, 'Reflexión', '2020-09-23 08:04:41', '2020-09-23 08:04:41'),
(193, 54, 'Activación', '2020-09-23 08:05:56', '2020-09-23 08:05:56'),
(194, 54, 'Elaboración', '2020-09-23 08:05:56', '2020-09-23 08:05:56'),
(195, 54, 'Consolidación', '2020-09-23 08:05:56', '2020-09-23 08:05:56'),
(196, 54, 'Reflexión', '2020-09-23 08:05:56', '2020-09-23 08:05:56'),
(197, 55, 'Activación', '2020-09-23 08:06:19', '2020-09-23 08:06:19'),
(198, 55, 'Elaboración', '2020-09-23 08:06:19', '2020-09-23 08:06:19'),
(199, 55, 'Consolidación', '2020-09-23 08:06:19', '2020-09-23 08:06:19'),
(200, 55, 'Reflexión', '2020-09-23 08:06:19', '2020-09-23 08:06:19'),
(201, 56, 'Activación', '2020-09-23 08:11:29', '2020-09-23 08:11:29'),
(202, 56, 'Elaboración', '2020-09-23 08:11:29', '2020-09-23 08:11:29'),
(203, 56, 'Consolidación', '2020-09-23 08:11:29', '2020-09-23 08:11:29'),
(204, 56, 'Reflexión', '2020-09-23 08:11:29', '2020-09-23 08:11:29'),
(205, 57, 'Activación', '2020-09-23 08:14:58', '2020-09-23 08:14:58'),
(206, 57, 'Elaboración', '2020-09-23 08:14:58', '2020-09-23 08:14:58'),
(207, 57, 'Consolidación', '2020-09-23 08:14:58', '2020-09-23 08:14:58'),
(208, 57, 'Reflexión', '2020-09-23 08:14:58', '2020-09-23 08:14:58'),
(209, 58, 'Activación', '2020-09-23 08:16:02', '2020-09-23 08:16:02'),
(210, 58, 'Elaboración', '2020-09-23 08:16:02', '2020-09-23 08:16:02'),
(211, 58, 'Consolidación', '2020-09-23 08:16:02', '2020-09-23 08:16:02'),
(212, 58, 'Reflexión', '2020-09-23 08:16:02', '2020-09-23 08:16:02'),
(213, 59, 'Activación', '2020-09-23 08:16:43', '2020-09-23 08:16:43'),
(214, 59, 'Elaboración', '2020-09-23 08:16:43', '2020-09-23 08:16:43'),
(215, 59, 'Consolidación', '2020-09-23 08:16:43', '2020-09-23 08:16:43'),
(216, 59, 'Reflexión', '2020-09-23 08:16:43', '2020-09-23 08:16:43'),
(217, 60, 'Activación', '2020-09-23 20:13:37', '2020-09-23 20:13:37'),
(218, 60, 'Elaboración', '2020-09-23 20:13:37', '2020-09-23 20:13:37'),
(219, 60, 'Consolidación', '2020-09-23 20:13:37', '2020-09-23 20:13:37'),
(220, 60, 'Reflexión', '2020-09-23 20:13:37', '2020-09-23 20:13:37'),
(221, 61, 'Activación', '2020-09-24 04:39:43', '2020-09-24 04:39:43'),
(222, 61, 'Elaboración', '2020-09-24 04:39:43', '2020-09-24 04:39:43'),
(223, 61, 'Consolidación', '2020-09-24 04:39:43', '2020-09-24 04:39:43'),
(224, 61, 'Reflexión', '2020-09-24 04:39:43', '2020-09-24 04:39:43'),
(225, 62, 'Activación', '2020-09-24 05:28:02', '2020-09-24 05:28:02'),
(226, 62, 'Elaboración', '2020-09-24 05:28:02', '2020-09-24 05:28:02'),
(227, 62, 'Consolidación', '2020-09-24 05:28:02', '2020-09-24 05:28:02'),
(228, 62, 'Reflexión', '2020-09-24 05:28:02', '2020-09-24 05:28:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blockly_activity_answers`
--

CREATE TABLE `blockly_activity_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `blockly_activity_answers`
--

INSERT INTO `blockly_activity_answers` (`id`, `activity_id`, `student_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"51eH;[1XS(_{]:|r;UJt\" x=\"203\" y=\"234\"><field name=\"VAR\">elemento</field><value name=\"VALUE\"><block type=\"math_number\" id=\"dOERj,Mi,q_toWqzeeby\"><field name=\"NUM\">0</field></block></value><next><block type=\"controls_if\" id=\"T;!zZqVZ(A-[ug1(u7F9\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"b7+Iz#53Vg1EvV0}g|[G\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"variables_get\" id=\"bGk7]ETnA0ZYf1mVW46s\"><field name=\"VAR\">elemento</field></block></value><value name=\"B\"><block type=\"math_number\" id=\"zLo}Jw]{m4wu-(*K8w1O\"><field name=\"NUM\">0</field></block></value></block></value><statement name=\"DO0\"><block type=\"controls_repeat_ext\" id=\"AY.vR?VNya]r_-p@o@13\"><value name=\"TIMES\"><shadow type=\"math_number\" id=\"[/g1t{;7@}{m[zV.UQfT\"><field name=\"NUM\">10</field></shadow></value><statement name=\"DO\"><block type=\"text_console\" id=\"CvAsCCtBgd7fj:*xVgp=\"><value name=\"CONSOLE\"><block type=\"text\" id=\"{`|96sUD_.Ue[y!dpkY4\"><field name=\"TEXT\">La sentencia es verdadera</field></block></value></block></statement></block></statement></block></next></block></xml>', '2016-11-29 01:53:56', '2016-11-29 04:53:56'),
(2, 2, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"block-variableSet\" x=\"174\" y=\"239\"><field name=\"VAR\">elemento</field><value name=\"VALUE\"><block type=\"math_number\" id=\"block-number\"><field name=\"NUM\">10</field></block></value><next><block type=\"text_console\" id=\"block-console\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"block-variableGet\"><field name=\"VAR\">elemento</field></block></value></block></next></block></xml>', '2016-11-29 01:51:20', '2016-11-29 04:51:20'),
(6, 1, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"block-console\" x=\"174\" y=\"265\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\">Hola Mundo! :D</field></block></value></block></xml>', '2016-11-29 00:52:51', '2016-11-29 03:52:51'),
(7, 3, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"controls_if\" id=\"block-if\" x=\"145\" y=\"190\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"block-compare\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"math_number\" id=\"dOERj,Mi,q_toWqzeeby\"><field name=\"NUM\">10</field></block></value><value name=\"B\"><block type=\"math_number\" id=\"block-number\"><field name=\"NUM\">10</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"J`rX*lwLS9DJg^!+Z@Yz\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\">La sentencia es verdadera</field></block></value></block></statement></block></xml>', '2016-12-19 05:34:01', '2016-12-19 08:34:01'),
(8, 7, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-11-29 02:21:30', '2016-11-29 05:21:30'),
(9, 8, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"block-variableSet\" x=\"309\" y=\"165\"><field name=\"VAR\">elemento</field><value name=\"VALUE\"><block type=\"variables_get\" id=\"block-variableGet\"><field name=\"VAR\">elemento</field></block></value></block></xml>', '2016-08-04 11:10:29', '2016-08-04 11:10:29'),
(10, 9, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-12-19 01:35:16', '2016-12-19 04:35:16'),
(11, 11, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"procedures_callnoreturn\" id=\"L,%T?eU^WYWfmUwX`w)x\" x=\"359\" y=\"24\"><mutation name=\"calc_primos\"><arg name=\"x\"></arg></mutation><value name=\"ARG0\"><block type=\"math_number\" id=\"(/=G|zrXJ9R=Io|.98Ut\"><field name=\"NUM\">11</field></block></value></block><block type=\"procedures_defnoreturn\" id=\"@lnW)e]yTFElrfCxn007\" x=\"374\" y=\"110\"><mutation><arg name=\"x\"></arg></mutation><field name=\"NAME\">calc_primos</field><comment pinned=\"false\" h=\"80\" w=\"160\">Describe esta función...</comment><statement name=\"STACK\"><block type=\"variables_set\" id=\"%%rPYwhX2!yg`X7#S6gY\"><field name=\"VAR\">d</field><value name=\"VALUE\"><block type=\"math_number\" id=\"9*=1HNV4ZM^j_cA-HJi%\"><field name=\"NUM\">2</field></block></value><next><block type=\"variables_set\" id=\"@U!BJ9@#Mehm[_FKi=VE\"><field name=\"VAR\">n</field><value name=\"VALUE\"><block type=\"variables_get\" id=\"Z[-9/O:O7/@ag)LE3oCR\"><field name=\"VAR\">x</field></block></value><next><block type=\"variables_set\" id=\"%-dli~N;={^b.S@U[Cup\"><field name=\"VAR\">primo</field><value name=\"VALUE\"><block type=\"logic_boolean\" id=\"d`Ax71~iS%XFum84S^_7\"><field name=\"BOOL\">TRUE</field></block></value><next><block type=\"controls_whileUntil\" id=\"?h3m1qD#HNkPVJa*(uwC\"><field name=\"MODE\">WHILE</field><value name=\"BOOL\"><block type=\"logic_compare\" id=\"6Iu1+pA/a.Ox|yZLbJuy\"><field name=\"OP\">LT</field><value name=\"A\"><block type=\"variables_get\" id=\"q+EXKR!DZbE9).Zai{~(\"><field name=\"VAR\">d</field></block></value><value name=\"B\"><block type=\"variables_get\" id=\"jVXvsa%BjD7ZBJoV.Jt?\"><field name=\"VAR\">n</field></block></value></block></value><statement name=\"DO\"><block type=\"controls_if\" id=\"_In40JfBC5icaS*{Ym6/\"><value name=\"IF0\"><block type=\"logic_compare\" id=\"H78ekSFcPQrRN}XJr?2,\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"math_modulo\" id=\"uLrLF?77nNXUpG]mmO=z\"><value name=\"DIVIDEND\"><shadow type=\"math_number\" id=\"x2)(h[e@e163*`u1Ctso\"><field name=\"NUM\">64</field></shadow><block type=\"variables_get\" id=\"~V`nyNT3@NHZ*PLw!%|?\"><field name=\"VAR\">n</field></block></value><value name=\"DIVISOR\"><shadow type=\"math_number\" id=\"Rd[r)OxaO4uhXU~:YLUT\"><field name=\"NUM\">10</field></shadow><block type=\"variables_get\" id=\"tCG`g@Bo%h1w*aHT*U{T\"><field name=\"VAR\">d</field></block></value></block></value><value name=\"B\"><block type=\"math_number\" id=\"|vO;*1apw3uB?kun|oH]\"><field name=\"NUM\">0</field></block></value></block></value><statement name=\"DO0\"><block type=\"variables_set\" id=\"]!yo^O4b._IaqR@X786+\"><field name=\"VAR\">primo</field><value name=\"VALUE\"><block type=\"logic_boolean\" id=\"GcU8^{Nf{Z|nxMDh,4Mr\"><field name=\"BOOL\">FALSE</field></block></value><next><block type=\"text_console\" id=\"IB}J{#(:DF)O{kRI2Og%\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\",:}#p@hau:9y7=SKbU(m\"><field name=\"VAR\">d</field></block></value><next><block type=\"controls_flow_statements\" id=\"|Z-OK#jJZompsa^N}K`f\"><field name=\"FLOW\">BREAK</field></block></next></block></next></block></statement><next><block type=\"variables_set\" id=\"rJ~xf|Ox%;.zCF^9WMKM\"><field name=\"VAR\">d</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"}u]=~qVBG.Vr0gacwZg8\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"3t9l-#?58rIgmpRG#yp^\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"1;M`/HYeR]zDKVLmc~A,\"><field name=\"VAR\">d</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\".0,*vjJ%9KRW~MS2M+^5\"><field name=\"NUM\">1</field></shadow></value></block></value></block></next></block></statement><next><block type=\"controls_if\" id=\"6)W9Nsp3caAB)w6_[/Nm\"><mutation else=\"1\"></mutation><value name=\"IF0\"><block type=\"variables_get\" id=\"gGtGvkC:bb:4nvM`XM25\"><field name=\"VAR\">primo</field></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"-:u~wjXFf{L%*#7;y~6f\"><value name=\"CONSOLE\"><block type=\"text\" id=\"5FFIxNUL)tn#1d37Yc5o\"><field name=\"TEXT\">Es primo</field></block></value></block></statement><statement name=\"ELSE\"><block type=\"text_console\" id=\"VhBHFuHAb|!x5y~OS46z\"><value name=\"CONSOLE\"><block type=\"text\" id=\"-#qV(3_Yh5BQ^HEx9mY0\"><field name=\"TEXT\">No es primo</field></block></value></block></statement></block></next></block></next></block></next></block></next></block></statement></block></xml>', '2016-08-05 16:48:05', '2016-08-05 20:48:05'),
(12, 10, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"controls_repeat_ext\" id=\"block-whileNum\" x=\"371\" y=\"221\"><value name=\"TIMES\"><shadow type=\"math_number\" id=\"CC2Pu=jJMOG@D8mfG9wb\"><field name=\"NUM\">10</field></shadow></value></block></xml>', '2016-08-23 08:18:57', '2016-08-23 08:18:57'),
(13, 1, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"block-variableSet\" x=\"280\" y=\"154\"><field name=\"VAR\">elemento</field><next><block type=\"text_console\" id=\"block-console\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\"></field></block></value></block></next></block></xml>', '2016-10-20 03:55:57', '2016-10-20 06:55:57'),
(14, 2, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"controls_if\" id=\"block-if\" x=\"192\" y=\"239\"><next><block type=\"text_console\" id=\"block-console\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\">La sentencia es verdadera</field></block></value></block></next></block></xml>', '2016-10-20 03:56:40', '2016-10-20 06:56:40'),
(15, 3, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-10-20 07:00:02', '2016-10-20 07:00:02'),
(16, 7, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"block-console\" x=\"267\" y=\"146\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\"></field></block></value></block></xml>', '2016-10-20 07:28:53', '2016-10-20 07:28:53'),
(17, 9, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"block-console\" x=\"176\" y=\"145\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\"></field></block></value></block></xml>', '2016-10-20 07:35:01', '2016-10-20 07:35:01'),
(18, 10, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"controls_repeat_ext\" id=\"block-whileNum\" x=\"375\" y=\"262\"><value name=\"TIMES\"><shadow type=\"math_number\" id=\"Q)t6BN=YGDBdWOY{mSFQ\"><field name=\"NUM\">10</field></shadow></value></block></xml>', '2016-10-20 07:35:23', '2016-10-20 07:35:23'),
(19, 11, 2, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"procedures_defnoreturn\" id=\"ps5qxZ]?51rU4h~R5)X2\" x=\"271\" y=\"68\"><field name=\"NAME\">hacer algo</field><comment pinned=\"false\" h=\"80\" w=\"160\">Describe esta función...</comment></block></xml>', '2016-10-20 07:35:33', '2016-10-20 07:35:33'),
(20, 5, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"procedures_defnoreturn\" id=\"q)S:/}%tyPzP.ST7kfz1\" x=\"171\" y=\"130\"><mutation><arg name=\"cantidad\"></arg></mutation><field name=\"NAME\">incrementarEdad</field><comment pinned=\"false\" h=\"80\" w=\"160\">Describe esta función...</comment><statement name=\"STACK\"><block type=\"variables_set\" id=\"nLx%/eTBM[xlH3{=9;:3\"><field name=\"VAR\">edad</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"!r65Jdw-)GDD8!+F[(4W\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Ud0]~u~-fP@WE}G-g[eY\"><field name=\"NUM\">18</field></shadow><block type=\"variables_get\" id=\"R!Wn2*7#:IYuZy)OK,yF\"><field name=\"VAR\">edad</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"ik=_t*4.te1047@S;SFb\"><field name=\"NUM\">5</field></shadow><block type=\"variables_get\" id=\"yNz(H2iHq(nf/r_g8DWx\"><field name=\"VAR\">cantidad</field></block></value></block></value></block></statement></block><block type=\"variables_set\" id=\"?(eT=N#MTw;%/zy@bQFC\" x=\"116\" y=\"238\"><field name=\"VAR\">edad</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"sY%:hc,U_*o/)/`o,^c-\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"]0m{qU1-/N8/6F,hNlvY\"><field name=\"NUM\">18</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"^anE.nH%MO/z1H/?O)cp\"><field name=\"NUM\">5</field></shadow></value></block></value><next><block type=\"controls_whileUntil\" id=\")x:8GFr}+T69BIm7H-65\"><field name=\"MODE\">WHILE</field><value name=\"BOOL\"><block type=\"logic_compare\" id=\"7frqI^/etHJ[.%}w5Kip\"><field name=\"OP\">LT</field><value name=\"A\"><block type=\"variables_get\" id=\"/.7ts1=l*Cfky+m/NA/G\"><field name=\"VAR\">edad</field></block></value><value name=\"B\"><block type=\"math_number\" id=\"kx+G38+oRL8F;_![V[iU\"><field name=\"NUM\">65</field></block></value></block></value><statement name=\"DO\"><block type=\"procedures_callnoreturn\" id=\"-#S18n~~B?cYNI:T;PF5\"><mutation name=\"incrementarEdad\"><arg name=\"cantidad\"></arg></mutation><value name=\"ARG0\"><block type=\"math_number\" id=\"OG~zjLjooY*s]#Cv:`jO\"><field name=\"NUM\">2</field></block></value></block></statement><next><block type=\"text_console\" id=\"bmIWtrLxD_;pD*L+IUTq\"><value name=\"CONSOLE\"><block type=\"text\" id=\"I:UH1oq~DLVPwoo,{,N(\"><field name=\"TEXT\">Ahora ya puedes entrar al club de la tercera edad, tu edad es: </field></block></value><next><block type=\"text_console\" id=\"ZD,Pw;S^XoZ01u9s|(al\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"1RjUa1Nyv(^J;4-J^lKo\"><field name=\"VAR\">edad</field></block></value></block></next></block></next></block></next></block></xml>', '2016-11-29 01:58:23', '2016-11-29 04:47:42'),
(21, 1, 3, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"block-console\" x=\"277\" y=\"244\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\"></field></block></value></block></xml>', '2016-11-11 09:26:58', '2016-11-11 09:26:58'),
(22, 6, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"procedures_defreturn\" id=\"AMHh,F%VQ*;BKRDBQ-3(\" x=\"161\" y=\"-10\"><mutation><arg name=\"genero\"></arg><arg name=\"peso\"></arg><arg name=\"altura\"></arg><arg name=\"edad\"></arg></mutation><field name=\"NAME\">calcularRMB</field><comment pinned=\"false\" h=\"80\" w=\"160\">Describe esta función...</comment><statement name=\"STACK\"><block type=\"variables_set\" id=\"!6{v6BfO?oZHmS()V^3,\"><field name=\"VAR\">RMB</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"rr2E4)T1M|5|Hzf2V#vr\"><field name=\"OP\">MULTIPLY</field><value name=\"A\"><shadow type=\"math_number\" id=\"lUprPCOnm6;h3eXemcQu\"><field name=\"NUM\">10</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"Jj#77WKz!yS~t*C|_MSM\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"d5gj[/+Q{`1p!Csdl}+x\"><field name=\"VAR\">peso</field></block></value></block></value><next><block type=\"variables_set\" id=\"rlf+yDDPax3;61+]katO\"><field name=\"VAR\">RMB</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"kcx=klvzxjm4bVFETICP\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Z{l+K=c=[XbJ@:g}IKri\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"}yU#Dlf*{zez?CQKWiW-\"><field name=\"VAR\">RMB</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"fQ|Tf-JOOF8:)aUQJ]4?\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"4GMdIi{Q3vWx}r[LULVM\"><field name=\"OP\">MULTIPLY</field><value name=\"A\"><shadow type=\"math_number\" id=\"=_JO=C?Y,-]q#crk6t}}\"><field name=\"NUM\">6.25</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"Nxc8_fwXc6B=M.kRLa2@\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"]Z:o,RYiDkA/^q*]io:`\"><field name=\"VAR\">altura</field></block></value></block></value></block></value><next><block type=\"variables_set\" id=\"}gADfEB6@NsQ61sqf/Ta\"><field name=\"VAR\">RMB</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"]bjp^dr)DRK1,}g]T-!X\"><field name=\"OP\">MINUS</field><value name=\"A\"><shadow type=\"math_number\" id=\"V1hO.m0TTSh_lVpxcVG(\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"wCF?.kr]#`[:aGdj0Q0a\"><field name=\"VAR\">RMB</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"qh6FzzB(G79/N`Jq]]AE\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"pi)#CJ{g`36)QY;cS}Vx\"><field name=\"OP\">MULTIPLY</field><value name=\"A\"><shadow type=\"math_number\" id=\",pmXwtCMtrEg#Ogbfjg%\"><field name=\"NUM\">5</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"B)UQ;)UOVeZS#Bu=IAW4\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"6rg,H)Z[Nzq+J~KhFRE_\"><field name=\"VAR\">edad</field></block></value></block></value></block></value><next><block type=\"controls_if\" id=\"}X87Rieb%?0_9P[S3kvf\"><mutation else=\"1\"></mutation><value name=\"IF0\"><block type=\"logic_compare\" id=\"Yxvg=h0S2aI;Q*,xQ))0\"><field name=\"OP\">EQ</field><value name=\"A\"><block type=\"variables_get\" id=\"sq*0e6Iz|N9QE3r@K)6x\"><field name=\"VAR\">genero</field></block></value><value name=\"B\"><block type=\"text\" id=\"},7.`(U0K},:;,`9_b;*\"><field name=\"TEXT\">hombre</field></block></value></block></value><statement name=\"DO0\"><block type=\"variables_set\" id=\"wJo^WALqQz+4ncKROS:*\"><field name=\"VAR\">RMB</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"x!a4~g|PIycjHVIUGPeO\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"`/miZk:vyoBu?WLcX)Fk\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"jYMO:Z,TsKp)=L^M#{mP\"><field name=\"VAR\">RMB</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"n+s63K``_btuh`_a;%I9\"><field name=\"NUM\">5</field></shadow></value></block></value></block></statement><statement name=\"ELSE\"><block type=\"variables_set\" id=\"tR_h5*6KwYNZtWwU!}aU\"><field name=\"VAR\">RMB</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"X}%SdK8!=0Qcz8!{-^RE\"><field name=\"OP\">MINUS</field><value name=\"A\"><shadow type=\"math_number\" id=\"bM[?!u_Vc%T9Eixzmsn*\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"n{Y]?*a7hM(t5*r:O.jh\"><field name=\"VAR\">RMB</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"*R}Rd8,_8jPxZ0)]~Y(W\"><field name=\"NUM\">161</field></shadow></value></block></value></block></statement></block></next></block></next></block></next></block></statement><value name=\"RETURN\"><block type=\"variables_get\" id=\"~jb]BmNtoHle%y!0`E)j\"><field name=\"VAR\">RMB</field></block></value></block><block type=\"variables_set\" id=\"Wyd-|EuX3TfS`D4VSXE,\" x=\"146\" y=\"345\"><field name=\"VAR\">genero</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"__Fw2`slM*NK7G:d_B8V\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"f#[r2^v8/Fq2Cg=6aJ[g\"><field name=\"TEXT\">Ingrese su Género - hombre / mujer</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"]]*2p?[9;QJ+X]I)0^DI\"><field name=\"VAR\">peso</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"u**NB}tGiiAJs4CWVwf1\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"6Az7:+(`cw?uHyzwgql~\"><field name=\"TEXT\">Ingrese su Peso en Kilogramos </field></shadow></value></block></value><next><block type=\"variables_set\" id=\"@?-lowo-aLj,;A3[:^dn\"><field name=\"VAR\">altura</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Pcqvw:v`r%FsUotBsFQE\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Jd3C~vCw=dMw1=]CKo@!\"><field name=\"TEXT\">Ingrese su Altura en Centímetros</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"[H{A/|1g=ip*Q7.|2Gl.\"><field name=\"VAR\">edad</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"{Id)xAFKr6,xrE)[3_`9\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"a*bEIk,!*.q;qxrR5BP#\"><field name=\"TEXT\">Ingrese su Edad en Años</field></shadow></value></block></value><next><block type=\"text_console\" id=\"G6G7[MAyQW}~g7PU2kr|\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"IR!n|/i)qZcqC|:2d-CF\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"m%)vhMUa(}y-V:SlMI2A\"><field name=\"TEXT\">Su RMB es: </field></block></value><value name=\"ADD1\"><block type=\"procedures_callreturn\" id=\"Rf_*[mcT@3rt2dKDu[0k\"><mutation name=\"calcularRMB\"><arg name=\"genero\"></arg><arg name=\"peso\"></arg><arg name=\"altura\"></arg><arg name=\"edad\"></arg></mutation><value name=\"ARG0\"><block type=\"variables_get\" id=\"e!5G%bXBp=C{t%+.eshS\"><field name=\"VAR\">genero</field></block></value><value name=\"ARG1\"><block type=\"variables_get\" id=\"f?WN(y9.5Y~pm7|J4E.m\"><field name=\"VAR\">peso</field></block></value><value name=\"ARG2\"><block type=\"variables_get\" id=\"z^4=zn2#QwE48Qe~:_oC\"><field name=\"VAR\">altura</field></block></value><value name=\"ARG3\"><block type=\"variables_get\" id=\"|:n`64,1)5O;EY`/t0Xo\"><field name=\"VAR\">edad</field></block></value></block></value></block></value></block></next></block></next></block></next></block></next></block></xml>', '2016-11-29 02:20:22', '2016-11-29 05:20:22'),
(23, 1, 5, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"block-console\" x=\"217\" y=\"149\"><value name=\"CONSOLE\"><block type=\"text\" id=\"block-string\"><field name=\"TEXT\">Hola Mundo!</field></block></value></block></xml>', '2016-12-18 21:18:21', '2016-12-18 21:18:21'),
(24, 14, 5, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-12-19 03:15:06', '2016-12-19 03:15:06'),
(25, 15, 5, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2016-12-19 04:29:06', '2016-12-19 04:29:06'),
(26, 14, 1, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"|;T*Ss)(.-2dl:V94tc7\" x=\"317\" y=\"108\"><value name=\"CONSOLE\"><block type=\"math_number\" id=\":+(.?9?#Q1%ifkphPT9Y\"><field name=\"NUM\">25</field></block></value></block></xml>', '2016-12-19 05:47:03', '2016-12-19 08:47:03'),
(27, 22, 8, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\",k%Y6Az6!aWJK*SC]FKq\" x=\"120\" y=\"83\"><value name=\"CONSOLE\"><block type=\"text\" id=\"z3krm_t^f#,G?Pp[.[U1\"><field name=\"TEXT\">Ven a mi casa a comer pastel</field></block></value><next><block type=\"variables_set\" id=\"+(_Z;qw-Vxx=Zn9~3_%4\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"sNy8n2aVdP/0;8%iDD8:\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"t5V~HQK^5ScFajar_)4T\"><field name=\"TEXT\">¿Cuál es tu nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"lp-/mU]PSt3Vsggf+U2A\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"d*;nUQv4;TyL6:RmR@yq\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"#46VJ-2UZ_+jy8Bh#%Ua\"><field name=\"TEXT\">Bienvenido, </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"4hX[fv-Mem8#~pn1?tzT\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-25 20:19:12', '2017-04-25 20:19:12'),
(28, 22, 17, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"@LmU[WnU[jN=iTI_G|PB\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"M-HO0P9@tE0b@5[yDB*V\"><field name=\"TEXT\"> Hola, quieres venir a un asado de conejo??</field></block></value><next><block type=\"variables_set\" id=\"R}TqD:3JWf!HTOZ_[5Qh\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"1|#+fTZW;OOIN*adL{?K\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"jwc;WWf8X;;NfQ(Ru;p_\"><field name=\"TEXT\">DIME TU NOMBRE</field></shadow></value></block></value><next><block type=\"text_console\" id=\"JOplU?f?#Ax@?h3mCL#c\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"F*dXe76m@:oa^^;4FsV2\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"4m#~-!UXWi%^Zf=9{`H;\"><field name=\"TEXT\">bienvenida</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"g,SO%`vD-U!j.5-=t56W\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:38', '2017-04-26 23:49:38'),
(29, 22, 17, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"@LmU[WnU[jN=iTI_G|PB\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"M-HO0P9@tE0b@5[yDB*V\"><field name=\"TEXT\"> Hola, quieres venir a un asado de conejo??</field></block></value><next><block type=\"variables_set\" id=\"R}TqD:3JWf!HTOZ_[5Qh\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"1|#+fTZW;OOIN*adL{?K\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"jwc;WWf8X;;NfQ(Ru;p_\"><field name=\"TEXT\">DIME TU NOMBRE</field></shadow></value></block></value><next><block type=\"text_console\" id=\"JOplU?f?#Ax@?h3mCL#c\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"F*dXe76m@:oa^^;4FsV2\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"4m#~-!UXWi%^Zf=9{`H;\"><field name=\"TEXT\">bienvenida</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"g,SO%`vD-U!j.5-=t56W\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:38', '2017-04-26 23:49:38'),
(30, 22, 27, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"+v`2|E5J?-ZopjSW/Lot\" x=\"-563\" y=\"-276\"><value name=\"CONSOLE\"><block type=\"text\" id=\"(*h{|6*3:jlz}[9S}W`0\"><field name=\"TEXT\">Hola ven a mi fiesta </field></block></value><next><block type=\"variables_set\" id=\"WE{@,AD8){f1+PwXaZo3\"><field name=\"VAR\">Basti</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"||hzd#3]so*as*R)K3pD\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"q96=)yJlA+Ps-TO0E7G4\"><field name=\"TEXT\">Dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"9O[@Kv*M.J6RuCCKPDpT\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"4x7_al2x1{c4c5Y`.4;z\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"HZ8);F7=_7l#E=b|vPfv\"><field name=\"TEXT\">Bienvenido </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"GQ/;VF0}tY9O}*P~;:B%\"><field name=\"VAR\">Basti</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:39', '2017-04-26 23:49:39'),
(31, 22, 11, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"rpfhh_JRG#w+~RJqM2~]\" x=\"316\" y=\"179\"><value name=\"CONSOLE\"><block type=\"text\" id=\"lM{=ggG#~cMszK#_r/PA\"><field name=\"TEXT\">Hola, te estoy invitando a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"`EI@1J6D]J^W615OI(9y\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"tJmX(]%EbE=r]M^]M/E;\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"*0(kK!:bU6}z:ZY_Jl5?\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"Z/yW~j+m(hMtVTGO-%OA\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"wkn0(l~%u+}ba/`CkzT@\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"uBfQd#(d;%H`_;h2+X)L\"><field name=\"TEXT\">Bienvenido </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"%Obu=U?|qV.c`+we%IN]\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:40', '2017-04-26 23:49:40'),
(32, 22, 19, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\")num}tLMgJism@f;jB{D\" x=\"9\" y=\"53\"><value name=\"CONSOLE\"><block type=\"text\" id=\"KVcE.%f(Ptqy4(:..ks;\"><field name=\"TEXT\">hola te estoy invitando a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"ZuD@LVrvg+urC1dn8ua;\"><field name=\"VAR\">nom,bre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"i@_1,FFYuxn0I`A2#p/L\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"-j+|C=FDw}|}9oK!+r3(\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"*?/F-2Jtdefi-.y5ZQS/\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"04Hg1m(UgwN9!s,v`Mvb\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"6+1B7hg^p8o-`Wv)B`^I\"><field name=\"TEXT\">Biemnvenido </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"(D7;r`Ehw{n[OfXhD6~B\"><field name=\"VAR\">nom,bre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:45', '2017-04-26 23:49:45'),
(33, 22, 28, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"GTP*G;E=mJPdj;fV#0os\" x=\"75\" y=\"65\"><value name=\"CONSOLE\"><block type=\"text\" id=\"3m%;/B!LAwsDAjriSrh`\"><field name=\"TEXT\">Hola!!!! te estoy invitando a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"A,FR26sODnVZd=N~|~WW\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"v=pOt)YaEQBy%CK!`|V*\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Ew?hphP*o7Q0{)f|op]S\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"u4Rs46Qo)=IlVYx+sRgQ\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"27E1wzk|z6X1qH[N:V!Y\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"+`~`=^ws?AXJ8I_nI6h}\"><field name=\"TEXT\">Bienvenido, </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"Gv#}DiYsV842[SEUg6-q\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:46', '2017-04-26 23:49:46'),
(34, 22, 18, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"r]7n{ZxOzwn;t8FMP9c:\" x=\"27\" y=\"80\"><value name=\"CONSOLE\"><block type=\"text\" id=\"LA-u7YuweuGI0-fZXBLw\"><field name=\"TEXT\">Hola te invito a mi fiesta </field></block></value><next><block type=\"variables_set\" id=\"Xv}S?#r8o=hG2K=CWN`T\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"/+Q0,c-QD_KJU4z7TTH%\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\";X2AtKCVFhka/CSv/c#-\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"^*zrOk[0yq3+SS7U1xH#\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"/F[bG^eThhID{PKL2V/r\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"L8DZ,OSlo,klC#,tCQUk\"><field name=\"TEXT\">Bienvenido,</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"=xL^6tKoUX*zldWeS1Bm\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:46', '2017-04-26 23:49:46'),
(35, 22, 22, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"XvaH=p:{i/WUtI1c|t-;\" x=\"27\" y=\"80\"><value name=\"CONSOLE\"><block type=\"text\" id=\"[3yK1YUjYJW5w`;4qdAw\"><field name=\"TEXT\">Hola!!!!!! te estoy invitando a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"ZSorV0f[7J]d39vuP#4=\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"n0`Y#JI_,7rraAatZ6%%\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\",LKMU54K0S#n+L|)rG#q\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"@k3%G[OJ_MFqNM?MC2(F\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"yzQ;%+c=zyBUVleBHqAK\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"Ldf:9`roiimQ*L?Hy4gX\"><field name=\"TEXT\">Bienvenido, </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"*fwx;cb[_T?#6t-r,*:*\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:52', '2017-04-26 23:49:52'),
(36, 22, 16, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"^UzFR5X|pw;}uM~ufV9r\" x=\"48\" y=\"70\"><value name=\"CONSOLE\"><block type=\"text\" id=\"r:Z#oU)!`@+2LebKa/MR\"><field name=\"TEXT\">¡¡Hola!! Quiero que vengas a mí cumpleaños. </field></block></value><next><block type=\"variables_set\" id=\"QM+8h04Ybai}{#4dqJ2J\"><field name=\"VAR\">Nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"e58?.ZVlAAZJ9zff[V1?\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Hx5)mN2}vCV%h]*rMyxU\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"T*w!N7uMg=QASQzMqSLR\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"7+d1v0ynB#Jf)c|VZNF;\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"7(p[u-dhICFh}^7m0^Nw\"><field name=\"TEXT\">¡Bienvenido! </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"=j6L?d[Q(T1h)/efldMl\"><field name=\"VAR\">Nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:53', '2017-04-26 23:49:53'),
(37, 22, 26, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"V2(U~SBO{h%JBY=wZalA\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"7LE=CJo@TM,E/ySG;Fv/\"><field name=\"TEXT\">Hola, te estoy invitando a mi casa a ver una pelicula</field></block></value><next><block type=\"variables_set\" id=\"*jiJ=Lz=Oj*VY^iJg+|X\"><field name=\"VAR\">cristian grey</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"v{eCqj[9~{GvlyjMhF7u\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"89wSY-A!i){tPjR!y/BV\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"~yroQcV)}dPJDX%tf:Y^\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\";M~w/Dz]65OM/U8-:YYW\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"RrE@Q2Grqt:MJ~oNT~k[\"><field name=\"TEXT\">Bienvenido </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"=2c;b]16.ur}Ms}wRNzX\"><field name=\"VAR\">cristian grey</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:49:55', '2017-04-26 23:49:55'),
(38, 22, 20, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text\" id=\"80b%mzfq~DM@Ok@u?|0S\" x=\"9\" y=\"7\"><field name=\"TEXT\"></field></block><block type=\"text_console\" id=\"r6zgdAr6!Qx-x|lx#8ry\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"bW=[b{cXRC/wT8#(W,gp\"><field name=\"TEXT\">Hola!!! te estoy invitando a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"5A1=Rq`Umrern^qnI;TN\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"TY=X={0Nce7%`r;e;@1t\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"gT=#K-jkV0hMo:),E_*?\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"kxP!gw)M6F!@@nVoUGoq\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"D]e9(uv6ZwTZd3~u_o.{\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"?8r*082DJyvc,8L;2J](\"><field name=\"TEXT\">Bienvenido!!!! </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"t8n5sBRR+#rT^lWc;eVt\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:50:12', '2017-04-26 23:50:12'),
(39, 22, 10, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"ktZMp%Z[-gbY|bI2e,te\" x=\"294\" y=\"39\"><value name=\"CONSOLE\"><block type=\"text\" id=\"q3dc[6C35WL9AAJqgYj+\"><field name=\"TEXT\">HOLA TE ESTOY INVITANDO A MI CUMPLEAÑOS</field></block></value><next><block type=\"variables_set\" id=\"XQtr[5p_zpPa@.*@rf|1\"><field name=\"VAR\">NOMBRE</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"KSZ+{~8HL.zLGFrlLRb)\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Dkof+%Icat75j@`tCKyf\"><field name=\"TEXT\">DIME TU NOMBRE</field></shadow></value></block></value><next><block type=\"text_console\" id=\"UcC~1I{/]aVX!;sj=oAX\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"5MKZCm|#yW4FoA/~cePK\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"~3@FT*hbEg_Nof(W#gih\"><field name=\"TEXT\">BIENVENIDO,</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"E^r97eMpA_oB?se`Dp]b\"><field name=\"VAR\">NOMBRE</field></block></value></block></value></block></next></block></next></block><block type=\"text_append\" id=\"if5D#0I-ms!4*S%],2]b\" x=\"1528\" y=\"490\"><field name=\"VAR\">elemento</field><value name=\"TEXT\"><shadow type=\"text\" id=\"+psEDs?o_0g@=X%=0L#6\"><field name=\"TEXT\"></field></shadow></value></block></xml>', '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(40, 22, 15, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"b9)CQBdV%}gvcsFuho_:\" x=\"459\" y=\"67\"><value name=\"CONSOLE\"><block type=\"text\" id=\"JbLpSaOsGFsOB!M:jfVV\"><field name=\"TEXT\">Hoaaaaaa !!!te invito a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"yO~O*f5XMS96i4PubQ+:\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"H=YZ/?YPukb:XsNf9fzU\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\".d/0h:d2fVB(PMiRRNlM\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"TJKdGu*N}0GDYY5s1?HB\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"at3Z`NwEBcLDSAx(nkNI\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"8l@S4^K2x!)~1u]Cm(du\"><field name=\"TEXT\">Bienvenido </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"]K{t[@N(i5K)e)IEsr94\"><field name=\"VAR\">nombre</field></block></value></block></value></block></next></block></next></block><block type=\"text\" id=\"i;tf,OJX!{Gq^p!Tvn`]\" x=\"336\" y=\"298\"><field name=\"TEXT\"></field></block></xml>', '2017-04-26 23:50:46', '2017-04-26 23:50:46'),
(41, 22, 21, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"Ub(Znkn**=+B|]ri21{:\" x=\"9\" y=\"53\"><value name=\"CONSOLE\"><block type=\"text\" id=\"{g[h-P++?p:sym:%#5@w\"><field name=\"TEXT\">Hola!! te estoy invitando a mi cumpleaños</field></block></value><next><block type=\"variables_set\" id=\"Ih[-Dc?W{`jIbogT^/:g\"><field name=\"VAR\">caua</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"_PEnn.P`s#LAZXi%=;LU\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"c_/b#[7bsXgbVIChkJjZ\"><field name=\"TEXT\">dime tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"|?|?dBWEJ-f@l]-ei]uw\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"hHH5TP-m_!%09aFg`?fQ\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"x[fPdJiH/QC?BKJo[rG4\"><field name=\"TEXT\">Bienvenido,</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"|9fJ-r2{dy__4jp|BfvN\"><field name=\"VAR\">caua</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:50:57', '2017-04-26 23:50:57'),
(42, 22, 25, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"gM}|d?CX44;,s^h7xKk=\" x=\"9\" y=\"53\"></block><block type=\"text_console\" id=\",_tzT.w6|4dsC58~6vd4\" x=\"29\" y=\"98\"><value name=\"CONSOLE\"><block type=\"text\" id=\"fp0`%RkW*nQq-9)MfFX|\"><field name=\"TEXT\">Hola, te invito a mi pijama party</field></block></value><next><block type=\"variables_set\" id=\"cb]%HFm[CGlA~T-8cm6l\"><field name=\"VAR\">Jon bon jovi</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"PE;0#0*RD5=3V7gOPk%-\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"pIk{RYMAYXnw*!=hDE5K\"><field name=\"TEXT\">jon bon jovi</field></shadow></value></block></value><next><block type=\"text_console\" id=\"BBmvB.-O~3hqrdBEa*XH\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\":zWt7_]9gQh9pAmU3rnv\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"4/z:Rh~XU7JmL,O%G-CD\"><field name=\"TEXT\">Bienvenido</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\")6?O%k%ik?gRC~4J`[Ct\"><field name=\"VAR\">Jon bon jovi</field></block></value></block></value></block></next></block></next></block></xml>', '2017-04-26 23:51:05', '2017-04-26 23:51:05'),
(43, 25, 16, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"IEW6^GL|3K,z(13b5`Kt\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"SZ3xQ^5sf;2fl1Tw5/4;\"><field name=\"TEXT\">Calculadora de trozos </field></block></value><next><block type=\"variables_set\" id=\"lr?#2|7Hg]p|!Z299D#`\"><field name=\"VAR\">Trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"MLT5{Lv5we2GmPX+?8:i\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"GMbPOLyV%gX0i5B~?Nx|\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"UzhWhP0NZw4RetfYvg-N\"><field name=\"VAR\">Trozo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"U9XN2_GZ.O`Oha!={+a7\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"(hnk{4]5=Lku:{.xlcm+\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"nimHZjkyodyZ)f|Ao18U\"><field name=\"VAR\">Trozo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"h`CZgfrce5DSIysyKU*I\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"@M*KExuLu^;B76L*L2nD\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Y]24kRE`BsE4tqa33(3u\"><field name=\"VAR\">trozos04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"J^8c^FgN)JH3Ud1DHU9^\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"I}{Pzjj[B+{lhX=^]J,=\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"SQa+F`TD;!O#o0@t(~BT\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"0n~W%{uoQTw/7};ZQn7H\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Vqm)OeIZeNzn0[CBwvt`\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\":7_gPmhANpkUA*w)hPL7\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"1o9vj9A{8sC1#a2Rgb4(\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"E//EceZXL.tAYaiP]yuf\"><field name=\"VAR\">Trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"VP?cYKJ8,u{D`#7D,{vo\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"6ntp^AH@}RrFBjao]ja*\"><field name=\"VAR\">Trozo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"#Ukr,zst#(`Z(83ia;Me\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"5W?:5kar~*oOpF|v`aXn\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"PpWba}?Psz996%pJ;5T8\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"xW76jM0?)Fq]7^+14=[9\"><field name=\"VAR\">Trozo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"v`-m7=it+[_uZZp6?Na?\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"~w(pG;^*Z~uo!Nn]*3:g\"><field name=\"VAR\">trozos04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"uWwS).t]E?bka+CJW;;F\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"5h7UHE9AMw)oq0~=M=rf\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"W+OsB4(K9}lykA_Et]7,\"><field name=\"TEXT\">El total de trozos de pastel es </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"r,ADC[|Y/(`#~/}PgUX9\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:10:24', '2017-04-27 00:10:24');
INSERT INTO `blockly_activity_answers` (`id`, `activity_id`, `student_id`, `value`, `created_at`, `updated_at`) VALUES
(44, 25, 10, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"ZD+;,-P5^,j0}oVsy@AJ\" x=\"93\" y=\"79\"><value name=\"CONSOLE\"><block type=\"text\" id=\"[oqM~-C[1VH~(0+sr|rH\"><field name=\"TEXT\">CALCULADORA DE TROZOS</field></block></value><next><block type=\"variables_set\" id=\"t7u:.`o~c@r1hV%Uq6MD\"><field name=\"VAR\">TROZO 01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"zUPkbdust3]9NJK4=wK5\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"UeTyb7-4*Z6@{|7G?s4+\"><field name=\"TEXT\">INGRESE TROZOS AMIGO 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"i]w/e/cqkL^)^xQi[I=r\"><field name=\"VAR\">TROZO 02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"w9uV?y`%Wg;c}c8bRGMH\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"TLGhD`LlNXpc8p_3wDeK\"><field name=\"TEXT\">INGRESE TROZOS AMIGO 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"E]qN/d!q%[-ek}C2gV;b\"><field name=\"VAR\">TROZO 03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"e)1a,cTtZ12Xc`K(@yxg\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"2+3FPBC7VSYH(GScUAZi\"><field name=\"TEXT\">INGRESE TROZOS AMIGO 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"{F{D)H?bvt9UY(p.,(*r\"><field name=\"VAR\">TROZO 04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"tlmnj7c_)xi[NTK3.{f)\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"pA;#fcs}^KL?(aqC^_;T\"><field name=\"TEXT\">INGRESE TROZOS DUEÑO DE CASA</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"{BHR]g=Q,RGEFHx-IcX*\"><field name=\"VAR\">RESULTADO</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"6[S=i1zi-67IeZpc~b.;\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"h2{N`_HG3zBtcvU~]u)}\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"cz.=R~5}5N=`,/rhD(TK\"><field name=\"VAR\">TROZO 01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"5S9M?|SgQ2YL)nRLi8u9\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"gyCnH[N/OYYtI^3uHDQw\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"5hfRgSeD)`uNPq);*_UP\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"T.X4:ro,sjsDCHxU0#zn\"><field name=\"VAR\">TROZO 02</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"]t^r2%3Uq]?Co.4ob}+c\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"4G*^)Lg3N4Q~4WOshy/]\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"ijyMLB5[q*t*PiSaSa0u\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"mn-mkNetCjo;Ox*LX^5c\"><field name=\"VAR\">TROZO 03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"{wi}bCzWf.ZWcKXgk8x(\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"nC9OMs?0]Yldk~r5n4I.\"><field name=\"VAR\">TROZO 04</field></block></value></block></value></block></value></block></value><next><block type=\"text_console\" id=\"3gjKpT@6`MXH4]+w[Spn\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"zHjYa.Fe_KI:#8[o^=`Z\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"khdUuOJqsCSV6SLS-4DM\"><field name=\"TEXT\">EL TOTAL DE TROZOS DE PASTEL ES</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"v?=!qO0a+FCY7#tzk,DV\"><field name=\"VAR\">RESULTADO</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:11:13', '2017-04-27 00:11:13'),
(45, 25, 27, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"FswmdZ}MLE@p}k[HtjOL\" x=\"-606\" y=\"-367\"><value name=\"CONSOLE\"><block type=\"text\" id=\"A,Il?ml@}0u7LCBsH1u=\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"A%uHlFix({2t%iln:Fxp\"><field name=\"VAR\">trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\",_;R`/~ka^-IX8Z7ayMA\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"UD=!Syr!b2N2aj(*z*u?\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"@A.n^_sQ]4XsZQ+l=ii~\"><field name=\"VAR\">trozo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\".I2X16oNw*v^29(=CO%M\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Esn^7(61`I{}Pq_NjPT]\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"~m,j_R2iV0Uj2`{ecDi!\"><field name=\"VAR\">trozo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"{}92:vNg?=T%Kyj9nhEL\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"B!Q.b0L6yGJ#)}b*IzeX\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\":TLFt#c;+.dBfw]vOvat\"><field name=\"VAR\">trozo04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"l6DppwGmol0f~(*+H/v{\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"*!)AI4+q@{XxHofBf)m0\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"vE:/v*.zD?gtCyl8sv8o\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"]%y#:;Shad,g~MNM`LU6\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"8#QERKXZl1*i5|=pnejF\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"e9mf259IER`)GT3vyTsL\"><field name=\"VAR\">trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"S7GMU1S]ZbmQqV/yVCW_\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"u8Cgg=!;!3rj:^hCtULi\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"]/pD{l)yb,j?_#GXZBnG\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"apOdS(Q_^HQ[STA.hpza\"><field name=\"VAR\">trozo02</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"6N],ce=E80(JM+I-[(Mc\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\",jf,%;X-6,];.Ptn@m`1\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"@^rq=:J7oNR6be6g7#Ve\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"@F,aD3p_uD9yK{j0|AaN\"><field name=\"VAR\">trozo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"su:8yJap?^Mgcs]y,u-2\"><field name=\"NUM\">1</field></shadow></value></block></value></block></value></block></value><next><block type=\"text_console\" id=\"R|%U*6v~q!3XwXLh=%5T\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"LA;u[=w]W4v]GaTm.:s*\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\",~}u,#0EO]:0Pj3PWr[L\"><field name=\"TEXT\">el total de trozos de pastel es</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"g@Wabz[UpN|q749~h;)=\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block><block type=\"variables_get\" id=\"@}YfmxGozaZXByQKRLZa\" x=\"19\" y=\"-221\"><field name=\"VAR\">trozo04</field></block></xml>', '2017-04-27 00:12:03', '2017-04-27 00:12:03'),
(46, 25, 26, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\".0kKDS/x#uOG,irOeoPC\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"Y!{Y]s_7YF4pU^lKzH5V\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"Mkb:Ilo%QTSp2iFsbUY2\"><field name=\"VAR\">trozo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"ld6GUsv#^AZ#8IlJ64a)\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"O;%;:m+A3*x[PGbxl2,U\"><field name=\"TEXT\">ingrese trozo amigos 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"|?fsq{ctD(-U4.VDvU^J\"><field name=\"VAR\">trozo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"tiwo}:G3zHLIL8xE|Jcv\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"J=uhaN~^(MLv#QqTTAgU\"><field name=\"TEXT\">ingrese trozo amigos 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"O?^ZuxtfSlL=:%M`x,UV\"><field name=\"VAR\">trozo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"3WUh,_e,Og+n:I)z.dAR\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"MoPQ}urJg{ze]L_18djn\"><field name=\"TEXT\">ingrese trozo amigos 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"zZ~GkLNUNo?6O_xjC|ue\"><field name=\"VAR\">trozo 4</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"6qiNZnA,*z^Jn?*??Cp[\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"6=#JTW*[b8%Uk|hkbaqf\"><field name=\"TEXT\">ingrese trozo amigos 04</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"y5{-10{.+?oF!ARUlVxk\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"=oy*vkD!*i){Nhy?(Wsv\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"#TbBH{5NU1Ee`!{l5bxl\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"dFb)Z~)R~k2rWIN_j;d7\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"RZs]T7nIScQQA%%h{4Hb\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"iZ2]PxH+Z8#_y`dO7x1W\"><field name=\"VAR\">trozo 1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"erMR~oXq}Re/%-i~2hfp\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Mj_N6~+8Oh!1CLeBaa:9\"><field name=\"VAR\">trozo 2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"4SiRhqiZF,OHKANLDY[6\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"V?f]Yz)tB@/z3d.4ro84\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"N~|`ti`SF)3fLf14OCMe\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Rc{{xiA6l]yx]Pz[UVeO\"><field name=\"VAR\">trozo 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"mv{Z-p[6M}G=#p:4hpf4\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"jU%c7Om4Tf,w[6~*[wS3\"><field name=\"VAR\">trozo 4</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"}oJ~98C9nEtQp}cAzuo*\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"U#HtI#/a+la26(PixtjR\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"FoexYhF7~)@_(wN`.jUH\"><field name=\"TEXT\">el total de trozos es</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"#-e[Wf*(kO7:XMCf/^}/\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block><block type=\"text\" id=\"n7+wMad,I+,,ivhD?FXB\" x=\"758\" y=\"420\"><field name=\"TEXT\">resultado</field></block></xml>', '2017-04-27 00:16:07', '2017-04-27 00:16:07'),
(47, 25, 22, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"g@x@con!it-dVs`tsF*h\" x=\"17\" y=\"87\"><value name=\"CONSOLE\"><block type=\"text\" id=\"l;i)%.iP@5VjH{pv-7z{\"><field name=\"TEXT\">Calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"D#|cNruF3EQ-4q42[SP/\"><field name=\"VAR\">trozo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"V~|_4/1A,=@(HVqyUP4e\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Oy2O8j*uYO*B2]1;E#yP\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"?#t7]u[T?rtudbDl(j(4\"><field name=\"VAR\">trozo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\".o~Rr^p)z7=k?T71t_VF\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"gRwtGhBH!H113KC:~UNB\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"=q6*/H|Z?}6|7JAf_vO-\"><field name=\"VAR\">trozo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"e`S,2F]fn!~y7B4.FJLF\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"iz,)WN)BUmBD3wrhuDw3\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Sp/#b-?7x0jSX,@BKG_S\"><field name=\"VAR\">trozo 4</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"uya)@]7T`)!cjiZ;:*mv\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"xcu36M6mCs`hS[oHggnG\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"+K94-63)j(CZ#0eEoO[T\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"_Q7+Wf*/gZ}2-GCKDT@v\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"m%!W]/u@2,Q)zeQ.Ene#\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"P0Q2J6@rZh2NFf}s#0yz\"><field name=\"VAR\">trozo 1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"iezG]/uAR8OL6U}PpeqF\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"?n?R-EL%kL8D{.MGg;X5\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"oN.yo1W+Gq]bGgFt.rc(\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"KA)uhIXcxMx1%CVB.sZ^\"><field name=\"VAR\">trozo 2</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"4MWO`%@qAvwFjHH-v,2y\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"4msbejP9a2ZWzJ)E@3rZ\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"c`CXdi}*_|D`6^#v]Gy{\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"eGe+q=qVXKqcLme5^g|w\"><field name=\"VAR\">trozo 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"VNFLZf#x+GI[O,]+)MTp\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"wfpb%e@Ft;;v}x{8oM68\"><field name=\"VAR\">trozo 4</field></block></value></block></value></block></value></block></value><next><block type=\"text_console\" id=\"=[/s{H!E8F6WZj?k1%#%\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"X5R^0ivHI?3)0L1uA|`l\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"TeI)P5;[D%VSXZ4Yy[pj\"><field name=\"TEXT\">el total de trozos de pastel es :</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"kd:`jWGM~]c^4zQuGqT,\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block><block type=\"variables_set\" id=\"1zRnrA`0lF)_::K9_Ea#\" x=\"29\" y=\"203\"><field name=\"VAR\">trozo 1</field></block></xml>', '2017-04-27 00:10:11', '2017-04-27 00:10:11'),
(48, 25, 28, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"e2(SSiW{ev^3P?!i?-c:\" x=\"26\" y=\"33\"><value name=\"CONSOLE\"><block type=\"text\" id=\"-!o,(w2L9LSPQk)Fg2#5\"><field name=\"TEXT\">Calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"i4+mKjrXT?.Az*0u|@d5\"><field name=\"VAR\">trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"`,;B3D8o8p6*DRJ3yh;I\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"1vr/)+liXIAwswK@Gc`L\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"68k7DHL7wlYzad4JYsQ)\"><field name=\"VAR\">trozo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"tpW1z42Nk1uJa)tT3gKy\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"PU=aF/94sweu~V78zK{R\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"#TsrJ9`Wd^}#w-A+`%p:\"><field name=\"VAR\">trozo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"6K0,28W@ML80{OgPP_:7\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"+4!wPc.k-f}tsLd0,g1y\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"*TRT8o6D9Oe]Xg?Usc0;\"><field name=\"VAR\">trozo04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"IpV5Ja:jEFWg^u0.(2et\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\":9s4?Ha@A^?/xJEV??7e\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"D;F=};=0sa-=OVI8_TBd\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"N4!g!xfyAT6OttDpXS]z\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Fqt*R2sit6u~|OHj5W8-\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"VGT}+H9c@Jex}7W_bTwV\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"G54zEhl0PwtQX21eH;mE\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"0yS}@XTUnSOHUcG`Y@7d\"><field name=\"VAR\">trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"T/enUv_A7R*Fu#YjV#4B\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"!JNJ^lXc_{1`M8(t?!@D\"><field name=\"VAR\">trozo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"*Kqy`M86;BI,jWqD:@3G\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"VVEHe/#cIhR[M3.Uoz4(\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"|4J9l{MM=;~fm+/x?o~Y\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\",|}r/-o4KKFN*A}+np=S\"><field name=\"VAR\">trozo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"4kDP=z^MjACvC2{Py1mr\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"{a*3~ed#7*_yg=mw5VzN\"><field name=\"VAR\">trozo04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"a@(x{f:AY;`,w7[k?D^C\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"zY[CVM|8^wz})D2T%kZ!\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"e,HQjVFqFY0Wpcx]R~qY\"><field name=\"TEXT\">el total de trozos de pastel es: </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"9P^vus@,e|?x)XaK}r4;\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:10:02', '2017-04-27 00:10:02'),
(49, 25, 17, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"I~0MzQ#K?[OdMi{DQHD2\" x=\"65\" y=\"-231\"><value name=\"CONSOLE\"><block type=\"text\" id=\"wY7J%Q/.f%0QDB*R,{xs\"><field name=\"TEXT\">calculadora de Conejos</field></block></value><next><block type=\"variables_set\" id=\"g7meqzzLJbRyk4G8*+K;\"><field name=\"VAR\">conejo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"XQoS%hmS,qUs?j1JU?Cn\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"z#TzHpX/E{.H#{v:n,Rc\"><field name=\"TEXT\">abc</field></shadow><block type=\"text\" id=\"VBzo,(1xcp(QMS4|kHR9\"><field name=\"TEXT\">ingrese cantidad de conejos amigo 01</field></block></value></block></value><next><block type=\"variables_set\" id=\"grVT=h~G^O;rGL@[69h=\"><field name=\"VAR\">conejo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Xkt-?uT4o0B.u8NFg8_v\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"xP[RE%!!fh%QcAZvKS3s\"><field name=\"TEXT\">abc</field></shadow><block type=\"text\" id=\")3t(?rSOzSV#Z8Il!JqG\"><field name=\"TEXT\">ingrese cantidad de conejos amigo02</field></block></value></block></value><next><block type=\"variables_set\" id=\"+ZzqsMg/Ynh0{SOxdxVj\"><field name=\"VAR\">conejo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"MK(|8VAMrks3N,yBB*c{\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\".bQ}+3[d}aK2j#b8b!8U\"><field name=\"TEXT\">abc</field></shadow><block type=\"text\" id=\".?P`BHEylBH?C@u2lFA/\"><field name=\"TEXT\">ingrese cantidad de conejos amigo 03</field></block></value></block></value><next><block type=\"variables_set\" id=\"=a|w(Nj`1YDKXyQo:#xT\"><field name=\"VAR\">conejo04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"JY:[DU;*QCpBdHlJfou?\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"c9u~ouc1m+Qv2%,^gy69\"><field name=\"TEXT\">abc</field></shadow><block type=\"text\" id=\"/oSCVkyiw?yG;:7}uyfV\"><field name=\"TEXT\">ingrese cantidad de conejos dueño de casa</field></block></value></block></value><next><block type=\"variables_set\" id=\"A4*Q+ZgZ2+%@!:yDn5^+\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"g.*iZ*oBl@oAT.(|oG[L\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"2qJ(N^LDqqy+mZ?cdXkc\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"Qg};4GXc[A-d++5V85-9\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"J^%t23ql}lvwv1K:f^G/\"><field name=\"NUM\">0</field></shadow><block type=\"variables_get\" id=\"=1#SXd4+UtwmVhiC*6H0\"><field name=\"VAR\">conejo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"Whp[NQovJ2hIQ((;)Ru7\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"us1rBWv[gx=7Fdo+mQO:\"><field name=\"VAR\">conejo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"}TC[MX_Cnht}3W0CwdOB\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"jNyX1r:%fQ#I#`72wLT9\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"CDUU}BYH?U-EB[MSyb[7\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"2:=1ce+URxUeW9/ezaQ[\"><field name=\"VAR\">conejo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"7sc^LlfD737qa@:/4a61\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"3[.?S@[k8`o9(rz/oE+U\"><field name=\"VAR\">conejo04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"bL9==HK*VkLb~|%2]w::\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"V(47{q|#7w[e:HmMREBq\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"bAg_EuNk)/:EV].GI}c_\"><field name=\"TEXT\">el total de conejos es:</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"uSn,fF~vG%wD(n4GIEB}\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:12:45', '2017-04-27 00:12:45'),
(50, 25, 25, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"3e1hzP}e*ci^Y^n=]_`9\" x=\"-67\" y=\"-66\"><value name=\"CONSOLE\"><block type=\"text\" id=\"jjqndgJ2`BenV}JL]CEc\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"_ieW;OcuPH#R.d`=aAq9\"><field name=\"VAR\">trozo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"FWavig_1(J(s9MMmk.@w\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"dk?NkkO_*;^71LUjm^J4\"><field name=\"TEXT\">ingrese trozos amigo 1</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"L%6?p.Im`YY?(@xt#p36\"><field name=\"VAR\">trozo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Y[8Bjl;~x?AJ03s%wh`v\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"|,M6vH21H#*Cbs=ii;o9\"><field name=\"TEXT\">ingreso trozo amigo 2</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"uYJ0nO.yzAGJg#M]Dw{N\"><field name=\"VAR\">trozo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\";w|v9Z],WFg#cy10g!bm\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Yl/Y+to6;T5*sv6HlpJ|\"><field name=\"TEXT\">ingreso trozo amigo 3</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"B]pKMO{zJHAOxuvJXbN!\"><field name=\"VAR\">trozo 4</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\")v!FKS9mR4Da8=C5b8Vf\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"%^R.sf0)qBWLbq+K%yCg\"><field name=\"TEXT\">ingreso trozo dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"s[i-Fa?Xx;k?uLm(Je?g\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"8mLK0M(PVJm(fw5U%a.o\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"6--A9;%Gr{USOvBUskL!\"><field name=\"NUM\">0</field></shadow><block type=\"variables_get\" id=\"~xz,S@=ly{.2y#3P;d#g\"><field name=\"VAR\">trozo 1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"RDB*;Z[o/GH7!`85*8`W\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"q}(yB@K(|xSwp^4ECKX3\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"z%*iuQIy#5C(+q#qe|:7\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Q?hNI+]-MZ]D2OB8ibWq\"><field name=\"VAR\">trozo 2</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"A:S=V=?ZUJMw0EX~4]GW\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"@)DS@;3Y4u7)7+F?l+N+\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"f[rNCY.L^OWMS0{J]UXl\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"gWejKmR,f_F:m:`S)Y8o\"><field name=\"VAR\">trozo 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"S_KznmuvM_3FW.0hl2*o\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"O[njZrMbNs~2CHNNHgE+\"><field name=\"VAR\">trozo 4</field></block></value></block></value></block></value></block></value><next><block type=\"text_console\" id=\"s3CAZCz9V`fw[VKQ{xgw\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"dxXIJ!S,BHN+i/I`_i6R\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"!cJ?jzNYBLfJ?h}j0+@]\"><field name=\"TEXT\">los trozos de torta son</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"lQ]t5Du}}[FEI(=x;6{e\"><field name=\"VAR\">1</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:14:43', '2017-04-27 00:14:43'),
(51, 25, 20, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"iiL(HJd=|SM,%.ffU^8|\" x=\"21\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"yY?3XnNldOl.geHe*fk5\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"vq2jG=5:9LAU-{=W5L^1\"><field name=\"VAR\">trozo 01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"2Eg0VFb+}d=|+7Lw)Y/*\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"`v:xd]*!v3*!N_dm()ma\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"m^h{;xOm)I.-=9;%Ss2R\"><field name=\"VAR\">trozo 02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"I2lo{(`+xHje(L131.)v\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"AUs|JOiTV@?Vt`q9saJK\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"QYjOsozdUktqnL4Co.Tp\"><field name=\"VAR\">trozo 03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"t~@}{)KJOIY4wWEMBhdq\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"e~:fJWuO_4e+)a!e_6*z\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"k*x7T0KzfZ7O87eLZR%A\"><field name=\"VAR\">trozo 04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"d2:j|;a+f)jG,R@wgk!+\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"qUUc3eO;]83!5L1i5%2}\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"YS?K~SCRJv%JyzF#PdWG\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"YsiX:?`9O5O.yg2afNZ`\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"=)TwSbw_)--(4I|UhxZ/\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"|STV0^1|rW;=38(vvMAV\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"wJLW@Fk#P`R49XJ}K6F}\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"JntiY.VR[b`V)A`}bfFp\"><field name=\"VAR\">trozo 01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"olD#Y[?VT;wBG8u(c=IA\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"iQC`vYf|?w_!bHG:-,it\"><field name=\"VAR\">trozo 02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"`GgNTKK~%O}@OfR2d%3A\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"}4k{[.MsrhL~D}sLIu;^\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"(g|teHa7V70nR-5[~.:h\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"4de^BmT)5[DF..;8OdR#\"><field name=\"VAR\">trozo 03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"fuAIr_-n(t1RG.ae2-hs\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"n-:Pwzak^i!uq?=~(s#y\"><field name=\"VAR\">trozo 04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"CmdF~R|t*ui_O:=q}DF`\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"}{V%H5X*1_9yyf0+M%|Z\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"uQr|54;I%sfM;s4HFh09\"><field name=\"TEXT\">el total de trozos de pastel es:</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"KNAJ@^[*yh^^z~lUzq+-\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:14:20', '2017-04-27 00:14:20'),
(52, 25, 19, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"|{kS@}N!1zhYRw=GXZc_\" x=\"9\" y=\"52\"><value name=\"CONSOLE\"><block type=\"text\" id=\"KBbcvY7+:pO9sFEa8H*l\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"|FG4k1oOk=-Lc}f+i8vb\"><field name=\"VAR\">trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"o9H/)AL%D1A.DTx_fYZl\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Dnk8mRk1+#;EF%e+Dd;1\"><field name=\"TEXT\">ingrese trozo amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"b^`gcxC.85s7{Oi_8C6c\"><field name=\"VAR\">trozo 02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"`]:NUHO{wtVsfU=.ReBg\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"4Z}vbtp-h9BH~3c%Q[WB\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"m[anhYN,;T+.C^HSF!j]\"><field name=\"VAR\">trozo 03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"6{HU1+gR|c=+SuKU.%c|\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"~(Wkr%Uhrn__/E}Rr@Q=\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"^b?Vl~feB!4YD}%nS{i`\"><field name=\"VAR\">trozo 04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"P2QccvA47KKlu[u.1-%x\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"WFyvXYYl[1j__YS7xD9~\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"V-nZo0tRG[Y!W+O@Y`4,\"><field name=\"VAR\">establecer resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"bD(Za{AzwC1V=Iq(fgF?\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"[E(ONul591J1N3TjKrF}\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"J?W/%K5yl@B0wWyS[Z1b\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Q[OgKa?Ya7IiIzWR~:Rv\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"@D0ThS@SNGEo(Or}@r%j\"><field name=\"VAR\">trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"rW)W9uy7ZZB%v:1hVfwo\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"zpI};uyn6q,6UN{6LHRZ\"><field name=\"VAR\">trozo 02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"ju!gUC?,:PP]XC].]M%j\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"7`Cyi([b@j#ATQF6@ArW\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"l`Ksno4xO5kdJ@~lCs%n\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"[OI^3vOeR-+nTZ;)4LQ8\"><field name=\"VAR\">trozo 03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"UMLR53wW}LJ-I*dAS8Dd\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"*5+fI.9GgA~V713:^j40\"><field name=\"VAR\">trozo 04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"f4{C,j68y;x?GO;;iFyx\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"8vTL-C.ky@cQsm.Ja;f~\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"mSU#=g[!oD)#c1iX/^T]\"><field name=\"TEXT\">el total de trozos de pastel es</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"mE.+q0+?}RgQ[I==[r{5\"><field name=\"VAR\">establecer resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:14:22', '2017-04-27 00:14:22'),
(53, 25, 11, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"2]XpK}54Qe32hI]1+2%B\" x=\"232\" y=\"133\"><value name=\"CONSOLE\"><block type=\"text\" id=\"lncB?`){5a~4nWoQ{a_+\"><field name=\"TEXT\">Calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"|V81J`_%!E=TlB{Fj,:@\"><field name=\"VAR\">trozo 01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"jpCJ+`/d)llDmWrigBTQ\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\".6cDQW@!AwpyxxVH1w2z\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"zwt9-67S07[*@j(~%D9x\"><field name=\"VAR\">trozo 02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"(+dkr=/Neg7``0,*2gPN\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"!@Ea^opL@bU5~D%D%[@H\"><field name=\"TEXT\">ingrese trozozs amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"X%A{Gm(^Y=WMl-Ot3c.(\"><field name=\"VAR\">trozo 03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"UsU2HVTd1G(JNM6=O;2U\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"TF[WszS8#:JKG@W:B1/v\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"pYnX`F9PK.zU*fLq}}!Q\"><field name=\"VAR\">trozo 04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"5hn_3IO%,TRjDKe!4=C3\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"z{Urj05*Qy]YA6XENKcY\"><field name=\"TEXT\">ingrese trozos dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"]bSEIZ6tBwa3k/BU`(b+\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"Xf|)R6s8_:ICs[5jY2-h\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Ij/P`9wU~%j=bOmQ~b/m\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"NWH?6/-Ua0z=6^Y+y[Hk\"><field name=\"VAR\">trozo 01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"IGnJ_Z;a#6dOK2MRF/w@\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"95{hjs-b@J!?!+L7fRri\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"/I+{Htx8K8gOlO8N):B[\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"y=PIF231k_GU5)w{!rH;\"><field name=\"VAR\">trozo 02</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"L97_^a0lj9]nwEi0PY97\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"t90^ouP4]V1i8m%(_Q=,\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"]pzI=U8IcRSW;luzY=Lz\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Z4EL_E+JMSn/so)lY+?t\"><field name=\"VAR\">trozo 03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"zD|6)KDbN7Kij4IWOOu[\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"NF3FJ9.2-jg;i{hd/(x9\"><field name=\"VAR\">trozo 04</field></block></value></block></value></block></value></block></value><next><block type=\"text_console\" id=\"5=`gEZ7pbP8sF3J7baE%\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"_99@M_w_~2cQH!MIj0Ev\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"4)oVa5PCZMX7btw|jzZ-\"><field name=\"TEXT\">el total de trozos de pastel es</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"UoWCDs}!J:MMf/d8ooS,\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block><block type=\"variables_set\" id=\"C@cU}fICU44FUj8sWaad\" x=\"335\" y=\"255\"><field name=\"VAR\">trozo 01</field></block></xml>', '2017-04-27 00:14:23', '2017-04-27 00:14:23'),
(54, 25, 15, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"ECY=Phnllt%|JlO)o=,r\" x=\"9\" y=\"53\"><value name=\"CONSOLE\"><block type=\"text\" id=\"3pOX=/NZ8/)tO0|m(V{w\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"(6#cZ(,NdT3gZ2K;J0wD\"><field name=\"VAR\">trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"I,)P);kZc;MxPh)Op%/v\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"_j;lq8bf{Hp1Fwq_mpVU\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"p{FN2sOmmaPZx[XL+vJK\"><field name=\"VAR\">trozo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"(5dg|YB3PAQmX5V%[wOC\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"by5nuU|*pp=`#`l18DkQ\"><field name=\"TEXT\">ingrese trozos amigos 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"[^l0eVH=4g+lH@HQS:#1\"><field name=\"VAR\">trozo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"nn)m{y|ntp5i*m/ygLlT\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"ixIGS6D-n.4z5Xr.@+25\"><field name=\"TEXT\">ingrese trozos amigos 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\":xY(Rh=H0et-)@pYO#Za\"><field name=\"VAR\">trozo04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"^fAy^:!6sJH5CwX0?KG0\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"}b=IF)s#zlA4kzlZ5S+5\"><field name=\"TEXT\">ingrese trozos amigos 04</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"TV;MpU%qjYWe/G{-~zYN\"><field name=\"VAR\">resultados</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"G=2+-;mWx3[@=j{O*brE\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"^0[0!dK@lDQ57}V^SM3h\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"Z1_kH9D|bDDJ-,gLn|5C\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"#@?RutZ;/EDys{_^4`I5\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"n%h8!ke@6RfKwYLlj%aX\"><field name=\"VAR\">trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"teG=M55?9GL0Sx]-[O-+\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"YUF5|!`ZR`deYZ]3MOug\"><field name=\"VAR\">trozo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"VR|IGR.R1|LzHRscvVj=\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"%|K:tjUmHn8;v_RuQPN_\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"+.Xh(]~2/h4)U4hIFO4-\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"r!U/_K@oMI/~4{{3ME_j\"><field name=\"VAR\">trozo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"fKM8);/^c0PnHtH5!8_H\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"E~LYO|P@;~EMEpVhb;^#\"><field name=\"VAR\">trozo04</field></block></value></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:14:41', '2017-04-27 00:14:41'),
(55, 25, 18, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"%IBycNbAL{Ot=Hg[aYiw\" x=\"28\" y=\"71\"><value name=\"CONSOLE\"><block type=\"text\" id=\"t+6(f^`o0cZ97mg2~XFG\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"vf9:rx#)/oOjL`l#GKiR\"><field name=\"VAR\">trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Yfql1?@F.#Z%+AQR37;D\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"3nYt]CHB8!Ny=HF1Uq?E\"><field name=\"TEXT\">ingrese trozo amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"^|y0RnNj0~#NyV9S2jf]\"><field name=\"VAR\">trozo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"2yRB~;XSn}K1J1l9h,m~\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"O1{M;9bu_fw5}4Dm1^.Z\"><field name=\"TEXT\">ingrese trozo amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"duYXy{74kX!Z)QsH36v7\"><field name=\"VAR\">trozo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"xyZR)2eeHSTCNliKod,?\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"=ZuK=b@f8V}bjgAfIwhK\"><field name=\"TEXT\">ingrese trozo amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"i:VQ/FzK9U!zR)FMwTX^\"><field name=\"VAR\">trozo 04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"OBgQ}oCASbLvqfB|/tuH\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"VA}3wKHozZNw{9/@xHRL\"><field name=\"TEXT\">ingrese trozo dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"wcGhDty%;qd?!~Ph?Rd)\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"N7c*-OxT|;KgfEMo9^9;\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"J#BgTif#fBb;#_SQ{Zo7\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"7YUCWO-]#w:K4N23!_4B\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\".V!#v~*fMYu/=mg3,[^W\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Dw=09zjDW2r_:yMhWFpH\"><field name=\"VAR\">trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"@3`Y.O_U*^ikYRcHuGb*\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\",v8Ad{/CaJO3?=(s!{02\"><field name=\"VAR\">trozo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"!kvh!jh/{DvBZ;yC]Upc\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"?Flq^{s#N2O+NhX%nS,9\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"A-~V4*RXJdVG@Uc@R[iF\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"cUW`_6yBP](Tg:zQAejL\"><field name=\"VAR\">trozo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"(}@i4^sa%Jxns=`p_2rX\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"q}n/nizQT5=8_W4+[*CB\"><field name=\"VAR\">trozo 04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\",53#0J3?;6(oz9NV7dYj\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"TL%}_2]7CDjv5l.CymMr\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"iQj-B7+Ma!*xMtSBE?hn\"><field name=\"TEXT\">El total de trozos de pastel es:</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"|Mj!^=drQ4ZSCPK^O@cd\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:15:10', '2017-04-27 00:15:10');
INSERT INTO `blockly_activity_answers` (`id`, `activity_id`, `student_id`, `value`, `created_at`, `updated_at`) VALUES
(56, 25, 21, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"Oq{*7C%iPrxw=VVO{TIO\" x=\"9\" y=\"53\"><value name=\"CONSOLE\"><block type=\"text\" id=\"(,LJ0?h;tejEsh#w@G6F\"><field name=\"TEXT\">calculadora de trozos</field></block></value><next><block type=\"variables_set\" id=\"gPlS5H=mX9wW`Zq^*/Nb\"><field name=\"VAR\">trozo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"9gzPe^h,5QZ2XP%dpiYj\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"8Grzs,{40HQ^U}NZE#oe\"><field name=\"TEXT\">ingrese trozos amigo 01</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"de*9z*Z_yPEL0n_(!*q2\"><field name=\"VAR\">trozo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"x7P?2(xZuLiw]FF5m!*w\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"jP,PN@}k^T;1#;PWorJ9\"><field name=\"TEXT\">ingrese trozos amigo 02</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"VNRw7;@.@^B}amyDSYj|\"><field name=\"VAR\">trozo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"u9UEKDDptR,_s|nf*eY*\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"en[ebVz2;wKF6Y||!C4Q\"><field name=\"TEXT\">ingrese trozos amigo 03</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"##-!WhAu3?5*WK;xb%ov\"><field name=\"VAR\">trozo04</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"H/.99dN7;UwyGxmOukf|\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"I3RaCDJ;.Uy[usTdlH(6\"><field name=\"TEXT\">ingrese trozos amigo dueño de casa</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"m}~Mr)e2^HNm}{LiS|J.\"><field name=\"VAR\">resultado</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"I~qnr%HZ(2WhLwjj8lFc\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"k`_GM3Do`rFt:z7y|!Q?\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"p0g,Trw%dcb`uiiQ#op3\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"mjGWhC^H4XFqrk`Fh*A4\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"/`(.6cSAy8:+F5Dk#2!;\"><field name=\"VAR\">trozo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"4A_,gf_|P`qWx-IAzpfb\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"y0[Y0:Q*5Zd]+@7okMDC\"><field name=\"VAR\">trozo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\".*my|o+EG8+5;WIq`%s[\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"t`@q7`I6)c0?C2_kX^9;\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"]n=L,,)-N56hXVAn/WEP\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"aW0!w.A)0T#!#R,vUH|.\"><field name=\"VAR\">trozo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"U5Cv|B~`qwoM,bH0ffKo\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"~R?1I3DN^X?]Fl*b;8K9\"><field name=\"VAR\">trozo04</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"?P6g!;sbmPGdYFLuX4hn\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"Ef[{Q!PN5i8FMUv1g{b4\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\".G1Tb!@TnVnFD1AnpIMl\"><field name=\"TEXT\">el total de trozos de pastel es</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"_ve!@#hDN+qi,kM05L`R\"><field name=\"VAR\">resultado</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-04-27 00:16:32', '2017-04-27 00:16:32'),
(57, 22, 33, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"C##gU=ja.(.y/O5@-nUf\" x=\"-10\" y=\"132\"><field name=\"VAR\">nombre_invitado</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"H)mJ{0Z2[peY@V0z%CUQ\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"7UuwMNY@.3zwxf}~S1x{\"><field name=\"TEXT\">abc</field></shadow><block type=\"text\" id=\"-j,.xd7#xc#2V~tpg=wC\"><field name=\"TEXT\">Hola! dime tu nombre</field></block></value></block></value><next><block type=\"text_console\" id=\"*v8I[Nw4RwF!XE1)sXKb\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"kde=#iBW{W^tI^J*o6u{\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"L/NMMs!9aME5R4%`GvNb\"><field name=\"TEXT\">Bienvenido  </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"5*nn#zNhRDc%dYf^G6p!\"><field name=\"VAR\">nombre_invitado</field></block></value></block></value></block></next></block></xml>', '2017-07-06 18:00:31', '2017-07-06 18:00:31'),
(58, 25, 33, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\".C/^J?N;EeUtx#yYOri^\" x=\"-181\" y=\"168\"><field name=\"VAR\">amigo1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Aud9D4+xY7N.5,AwVKIT\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Ou%l82433nmgK5{0`a`L\"><field name=\"TEXT\">Amigo 1.¿cuántos trozos te comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"a92eRai3+]O{sU|,aI+s\"><field name=\"VAR\">amigo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\")i4.TXhK3[rLLMMIKxRK\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"dsSfd@i2J0yUWqtv23G-\"><field name=\"TEXT\">Amigo 2.¿cuántos trozos te comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Pg6}ygTixmRrVCR6P96d\"><field name=\"VAR\">amigo3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\".Cea#jvK/0!mHbiaQVn6\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"BhEHY;lP=:K3,0=l.1O?\"><field name=\"TEXT\">Amigo 3.¿cuántos trozos te comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"yWe!xq,{,L|Z.5F]fVY^\"><field name=\"VAR\">cumpleanera</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"cR-m;r_d@l~CLAXS?i[M\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"7`oiH.S5Wtfry7/{/rAS\"><field name=\"TEXT\">Cumpleanera, ¿cuántos trozo me comeré?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"ngmiEzc3p.d:VkK9?%y~\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"r)!9;Xsg1f2_YL@;i@N:\"><mutation items=\"3\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"^Ei:ba:{pWPQKvbA,pnU\"><field name=\"TEXT\">se comerán </field></block></value><value name=\"ADD1\"><block type=\"math_arithmetic\" id=\"|X8*J%zZh0.mzT}eqdCB\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"gi4O],}Q%o[NY)0(`+.@\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"m|{*2|)IMVO6Z=uIGiFW\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Y8~tazP{Fk:y7w;`66L8\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"4~0{OOW)Y?eA+fcWnUu=\"><field name=\"VAR\">amigo1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"=j4mtKWS,)!l5Q*=Jf*k\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"@Kj:VF^IpD]z5=~ZwSz;\"><field name=\"VAR\">amigo 2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"=2yBA`a){YIfwI8C2vl|\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"ZTi*1uLX,%l`wsx`!TZ@\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Qa7fsUr*~u]h9#hv-P5`\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"]aT#}(zI.0L}=tE1IItp\"><field name=\"VAR\">amigo3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"0gP8oIMPO9#:SifuL*+[\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"HJT`k,igw4/Z4Z[v15)3\"><field name=\"VAR\">cumpleanera</field></block></value></block></value></block></value><value name=\"ADD2\"><block type=\"text\" id=\"#x(``g.]eT,i]@FtNn8Z\"><field name=\"TEXT\"> trozos de torta</field></block></value></block></value></block></next></block></next></block></next></block></next></block></xml>', '2017-07-06 18:14:25', '2017-07-06 18:14:25'),
(59, 23, 33, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"ayDv*Y%aa_ULoO!3Y9_0\" x=\"-196\" y=\"30\"><field name=\"VAR\">trozo de torta</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Sat@J]pJ(Hsh2.W4dUtH\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"yXA@|+W^Mh!G?GcNl{T_\"><field name=\"TEXT\"> ¿en cuántros trozos se dividió la torta?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"-*AoAYbbkSgz*~{v1kVK\"><field name=\"VAR\">amigo1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"lu7^@GQ/IbwLiKnj1-aT\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"T*xiiv#|k4XMI`VukDRS\"><field name=\"TEXT\"> ¿cuántros trozos te comiste amigo 1?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"gtief7[V3WlGs5ABc9uC\"><field name=\"VAR\">amigo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Z6r{NeAt0u1.17QDd/AD\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"VUb5fpn7Zd1d5!Ln8cJ?\"><field name=\"TEXT\"> ¿cuántros trozos te comiste amigo 2?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"]W!8Covn!{L,2i0|w01^\"><field name=\"VAR\">amigo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"-f6Wt,/R8f1uK+F.4B37\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"@SDnEHc%},!O{,qeIB|Z\"><field name=\"TEXT\"> ¿cuántros trozos te comiste amigo 3?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"0hGh%e-!Y!YHGHEPP-`M\"><field name=\"VAR\">cumpleañera</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"m).u-p_}891JmFynQT3M\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"0*{aY*:ZQwql%T]:8r*x\"><field name=\"TEXT\"> ¿cuántros trozos me comí?</field></shadow></value></block></value><next><block type=\"controls_if\" id=\"@E+X/~N_=kLeFhaiW|~f\"><mutation else=\"1\"></mutation><value name=\"IF0\"><block type=\"logic_compare\" id=\"cT;(2uiz^w]%H;j6nagU\"><field name=\"OP\">LTE</field><value name=\"A\"><block type=\"math_arithmetic\" id=\"t(A7VGp!2:h|{C50DY5.\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\".BiFr[H0e,XBuF4I~au)\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"SXFY:o_2QZ3o#]58O*IU\"><field name=\"VAR\">amigo1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"u9mt[}`MLgJ##gs/T8L,\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"t3c!QtUIbEqK+#j,.~W,\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"YRgzoYVsx}]nMP;M^^v0\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"W=Fir(65EWD%piUBg0.Z\"><field name=\"VAR\">amigo 2</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\";9ZFxrKBLEcUd~Hm)+rf\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"#S{_1|BNQnj1eR62|^o1\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"S{d!}V1i)!?O1@X:3pDG\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"n+hX`Z1XXYRNt1OS!uwK\"><field name=\"VAR\">amigo 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"^E@Qv)BM[2w?+6|P}PC^\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"+`p]`Sv4lQHZ6Y8P=zW2\"><field name=\"VAR\">cumpleañera</field></block></value></block></value></block></value></block></value><value name=\"B\"><block type=\"variables_get\" id=\"_Q5K[gTeyxu(!dGOci:N\"><field name=\"VAR\">trozo de torta</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"K*T~!cA%4qen0!#ap;^`\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"%cV_=C!}5YKwr5)A1*RR\"><mutation items=\"4\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"}ITCs6v.Nfgkydq~*,e,\"><field name=\"TEXT\"> En total se comieron  </field></block></value><value name=\"ADD1\"><block type=\"math_arithmetic\" id=\"/}1g9X^6i1ix|P;M#Gle\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\".BiFr[H0e,XBuF4I~au)\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Z#T.,_zQ0Sh,AnlP#@NE\"><field name=\"VAR\">amigo1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"u9mt[}`MLgJ##gs/T8L,\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"11IL+Ef^~U,-hvCl/0Wx\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"YRgzoYVsx}]nMP;M^^v0\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"EE)=Rb09#LJS0ZP^W^WW\"><field name=\"VAR\">amigo 2</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\";9ZFxrKBLEcUd~Hm)+rf\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"iq4wM|E0c1taDbJm3xh#\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"S{d!}V1i)!?O1@X:3pDG\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"oTjqEAz858:U0#:RCr,*\"><field name=\"VAR\">amigo 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"^E@Qv)BM[2w?+6|P}PC^\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\".MSRvsdq@p^85b8fXJd7\"><field name=\"VAR\">cumpleañera</field></block></value></block></value></block></value></block></value><value name=\"ADD2\"><block type=\"text\" id=\";@B,aX%~d;KGmWbfRlh*\"><field name=\"TEXT\"> de un total de </field></block></value><value name=\"ADD3\"><block type=\"variables_get\" id=\"[~Woi-Qq:QJw/0F+emuN\"><field name=\"VAR\">trozo de torta</field></block></value></block></value></block></statement><statement name=\"ELSE\"><block type=\"text_console\" id=\"Wa:(lPH@Z@-zR2j%Z^!q\"><value name=\"CONSOLE\"><block type=\"text\" id=\"#10y}@c8`}Q,F9R`K#!a\"><field name=\"TEXT\">error</field></block></value></block></statement></block></next></block></next></block></next></block></next></block></next></block></xml>', '2017-07-06 18:36:51', '2017-07-06 18:36:51'),
(60, 26, 33, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"math_random_int\" id=\"mD:e|bf}y8rFliro4#=X\" x=\"-267\" y=\"401\"><value name=\"FROM\"><shadow type=\"math_number\" id=\"!_mu/:}ZIzDBvQ}s,,fn\"><field name=\"NUM\">1</field></shadow></value><value name=\"TO\"><shadow type=\"math_number\" id=\"xQ/[?h7Y3em;HI=)~^iM\"><field name=\"NUM\">100</field></shadow></value></block></xml>', '2017-07-06 19:17:36', '2017-07-06 19:17:36'),
(61, 47, 33, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"k76_bqWdVP,,=wZ[*qVi\" x=\"5\" y=\"5\"><field name=\"VAR\">problema</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"wCrxzY^VDUohHbOc!`fO\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"+hNPb8}*uK%gkJC^({Wm\"><field name=\"TEXT\">escribe el problema</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"aR0/~VE2UrTW9})1)e95\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"#aFh3-75Rhh?[*uQW]4_\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"V=cneK8CiqgRT1k7hg1W\"><field name=\"TEXT\">escribe el problema</field></shadow></value></block></value><next><block type=\"text_console\" id=\"AS/hs1ZsMKD4oD:%)e`9\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"UuU=Zo5c`3)V;hBEn3V.\"><mutation items=\"3\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"~|TTBuy5#TmrQ)^[(FEb\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"n,CZEgbQPamh!@!hw4l:\"><field name=\"TEXT\"> propone el problema...</field></block></value><value name=\"ADD2\"><block type=\"variables_get\" id=\"EJ{10I68/50C~=yY3TPK\"><field name=\"VAR\">problema</field></block></value></block></value></block></next></block></next></block></xml>', '2017-07-06 19:22:47', '2017-07-06 19:22:47'),
(62, 22, 35, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"r{(*pl,^UDK/,pszMMG]\" x=\"110\" y=\"81\"><field name=\"VAR\">Nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"OS0X-U~iDRQTR67Sgl}N\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"[3^?r`6,3z3i,iKk^?fI\"><field name=\"TEXT\">Titulo</field></shadow><block type=\"text\" id=\"/1EYg^b?X11@jUK3n(Pa\"><field name=\"TEXT\">¿Cual es tu nombre?</field></block></value></block></value><next><block type=\"text_console\" id=\"4nFpNK^6(%uf/2E1GVqk\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"`5s~DbLB73n;ewzLeZAm\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\",6g8ZK?=yZgKZ2g?tYVf\"><field name=\"TEXT\">bienvenido</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"_TOpQ%}41`JqTy_+56ax\"><field name=\"VAR\">Nombre</field></block></value></block></value></block></next></block></xml>', '2018-07-10 19:12:47', '2018-07-10 19:12:47'),
(63, 22, 34, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"8gH^[Q/o13q]:+ohDQ7;\" x=\"63\" y=\"123\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"QE!V/XFUK_-jmB:zHJyn\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"XpQR,hu1jOIx.ptg@aK1\"><field name=\"TEXT\">abc</field></shadow><block type=\"text\" id=\"N}xqK!p7Lx36AKDB!ViV\"><field name=\"TEXT\">Cuál es tu nombre?</field></block></value></block></value><next><block type=\"text_console\" id=\"Tjp.LFZisR^eVp~NTTJ2\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"VoWZ2i@(pfcJmm9M?BBs\"><mutation items=\"3\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"6:}v#+J`eBz~GTb]v`t.\"><field name=\"TEXT\">Hola </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"{i@g[1LDXdF{jx]YB*~q\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD2\"><block type=\"text\" id=\"7Vy.0=],TMhs1E|zfK-X\"><field name=\"TEXT\">, bienvenida!</field></block></value></block></value></block></next></block></xml>', '2018-07-10 19:18:39', '2018-07-10 19:18:39'),
(64, 25, 34, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"QI_Txyn/4=L82QDf)6gI\" x=\"-98\" y=\"7\"><field name=\"VAR\">trozos1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"t,uFzMIqnnnm|@)wuB)e\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"/s6j~@]JDj[_dGe5=1U=\"><field name=\"TEXT\">Cuántos trozos de pastel planeas comer?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"|9nmgW=oHC[gtyJB0rM#\"><field name=\"VAR\">trozos2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"U-Sn0`iqv*.pA42_jd^E\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"q[#nG6WAUqIfK(kpwg.@\"><field name=\"TEXT\">Cuántos trozos de pastel planeas comer?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"|,ss_E;tj?{Cv5|OTd!y\"><field name=\"VAR\">trozos3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"l=PMT!njV@9gs+0E/0`.\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"1CrR^/mo/r{y12iMVa+j\"><field name=\"TEXT\">Cuántos trozos de pastel planeas comer?</field></shadow></value></block></value></block></next></block></next></block><block type=\"text_console\" id=\"Sm6W8c{CXvR6TsMR-_R`\" x=\"-98\" y=\"208\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"Nf:~sB?1X]ZSN{DqM8bN\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"o~D*[@UV)}F_4V5iv5*m\"><field name=\"TEXT\">Deberás cortar tu pastel en </field></block></value><value name=\"ADD1\"><block type=\"text_join\" id=\"%RXo%evrrP{s76@xX%}%\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"math_arithmetic\" id=\"|Bfp+zfXgh;QjIw*a/)J\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Ic6s+}#5P!V`~l{AZsG%\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"Ba_.~Mg%BGXikL:.aox}\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"%fpK09-kR=qgK-DA8#mc\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"HAoEBt%]lmr]C-MxLS7[\"><field name=\"VAR\">trozos1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"[_K,nypS?Q^KxBVgTFf`\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"6rGzL+H0L3pcgvQeZN:z\"><field name=\"VAR\">trozos2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"ZpcK0SXGcNa@75U+}tc0\"><field name=\"NUM\">2</field></shadow><block type=\"math_arithmetic\" id=\";E_MC.xbJg{G^##uMsiI\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"~ehoSi5@(X:d{A%g1V)N\"><field name=\"NUM\">2</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"k2x+`!%amOEcq2)m)@Wi\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"m1`@i+|``_(/J:jIm94G\"><field name=\"VAR\">trozos3</field></block></value></block></value></block></value><value name=\"ADD1\"><block type=\"text\" id=\"u`_~c4be2G6G7W`7fhH5\"><field name=\"TEXT\"> trozos</field></block></value></block></value></block></value></block></xml>', '2018-07-10 19:37:24', '2018-07-10 19:37:24'),
(65, 25, 35, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"0@f_h7JdcgB_83o#LBT_\" x=\"85\" y=\"36\"><field name=\"VAR\">TrozosPrimerInvitado</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"naQl[@sb6E,w|^b6LjP0\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"Fs9N[%nw^9KN;Cor5zDO\"><field name=\"TEXT\">¿Cuantos trozos comera el 1er invitado</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"nxZ?yXW=]jlj}[K7Q/dA\"><field name=\"VAR\">TrozosSegundoInvitado</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"qof9+Prd#U/q|Z=d4~iS\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"#9yCqnVd=.1pUvko.D[n\"><field name=\"TEXT\">¿Cuantos trozos comera el 2do invitado</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"W7},4tQCznXJk3pJA*z{\"><field name=\"VAR\">TrozosTercerInvitado</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"YxnfOKE+4VI[PqU8[FfD\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"pmj`j-My?|JBm,]Oro%*\"><field name=\"TEXT\">¿Cuantos trozos comera el 3er invitado</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"wmzCh[!tNg.u+w,w+Bo.\"><field name=\"VAR\">TotalDeTrozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"ZK2F4;Y/[6!lwf1y!bi2\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"zsdMNel[r}~EA*n{rIo}\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"oEz9q4j5,vVA~L#uYWb7\"><field name=\"VAR\">TrozosPrimerInvitado</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"PjhCGA-{j{U,Fq~UW`}U\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"o2v_l+LCh,NUC{3RvPV`\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"L@Bi8m_9g-`8acVM_?OB\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"gteZvwW_zZ5RHa+bB*=T\"><field name=\"VAR\">TrozosSegundoInvitado</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"%lA[7:iIOKCs[axbXP3|\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"d{u!uGNvd^lDr:thBv#p\"><field name=\"VAR\">TrozosTercerInvitado</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"yQFb.5/yE5M%eZQi]!ck\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"-l@n1[0_nW@jB41m}9-r\"><field name=\"VAR\">TotalDeTrozos</field></block></value></block></next></block></next></block></next></block></next></block></xml>', '2018-07-10 19:41:08', '2018-07-10 19:41:08'),
(66, 23, 34, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"variables_set\" id=\"9k.zbX=;LSMv;WVNUOE+\" x=\"-82\" y=\"26\"><field name=\"VAR\">trozos_comidos</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"z~zdr|1syyNh%UKj:V~k\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"i}^OW@(c:_Hz]L7?Q^}X\"><field name=\"TEXT\">Cuántas porciones comimos entre todos?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"~T)#{[0hkok`(Q8`Q|(t\"><field name=\"VAR\">trozos_restantes</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"j/1^feG7L:j)H]g``MPN\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"pHVd7h^}-LB[OUT!n1--\"><field name=\"TEXT\">Cuántas porciones quedaron del pastel?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"WcVURlD[Zg6cguBt?HZA\"><field name=\"VAR\">trozos_totales</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"2Xr:z#:YP8l0UJx(U/xD\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"L~jP7t3v[S{9AN%hz,[c\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\";g=v.iuM%7j?BFw1_Cy7\"><field name=\"VAR\">trozos_comidos</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\".RJ4Hq=l1I7y{}@/3^uY\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"^I#}YLfwHj%;iSe,Zs)(\"><field name=\"VAR\">trozos_restantes</field></block></value></block></value><next><block type=\"variables_set\" id=\"i%~%TzWaNRVyjT32eKx}\"><field name=\"VAR\">fraccion_comida</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"/i*#dPO(H6BOlwC`b~Ao\"><field name=\"OP\">DIVIDE</field><value name=\"A\"><shadow type=\"math_number\" id=\"jfZudit`Bw}^0|KU(uGR\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"|!sBq`9H}VEyc.uV3?Kn\"><field name=\"VAR\">trozos_comidos</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"+x;c|O8fienw6jT6-8.0\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"*RNBYcAj;8%%=|qVK7h^\"><field name=\"VAR\">trozos_totales</field></block></value></block></value><next><block type=\"text_console\" id=\"wGoip.CcD#6!,rb-!QP{\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"KKz2EfIJO2sQBU~(:U1T\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"^_O:d2@zD_Wfuw!BB)md\"><field name=\"TEXT\">Nos comimos </field></block></value><value name=\"ADD1\"><block type=\"text_join\" id=\"Ls4};4UclLhkGF3Pv,t#\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"|kxTG!*aIVCbvR%DUplx\"><field name=\"VAR\">fraccion_comida</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"5|tj*KeaT2//v3yHtFN0\"><field name=\"TEXT\"> del pastel</field></block></value></block></value></block></value><next><block type=\"controls_if\" id=\"#Skg#(87zxDZipG5ph54\"><mutation else=\"1\"></mutation><value name=\"IF0\"><block type=\"logic_compare\" id=\"UOnXR1v{jjeWI1.|__0L\"><field name=\"OP\">GTE</field><value name=\"A\"><block type=\"variables_get\" id=\"B?%pk)E]q?ylpdhEPVW)\"><field name=\"VAR\">fraccion_comida</field></block></value><value name=\"B\"><block type=\"math_number\" id=\"^J:%Oln3!y=imm%H92Ua\"><field name=\"NUM\">1</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"(Y4~uE](N!:*n(jVK+@`\"><value name=\"CONSOLE\"><block type=\"text\" id=\"eL;Mprp[80]30djc9XfE\"><field name=\"TEXT\">No invitemos al vecino!</field></block></value></block></statement><statement name=\"ELSE\"><block type=\"text_console\" id=\"gEnzVU8.(FH!}AJ:(UvG\"><value name=\"CONSOLE\"><block type=\"text\" id=\"*s%)J5M_g!dH3L^`GlUp\"><field name=\"TEXT\">Invitemos al vecino!</field></block></value></block></statement></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-07-10 20:00:09', '2018-07-10 20:00:09'),
(67, 23, 35, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"controls_whileUntil\" id=\"G3/:1^s{ffBFkuFmFmNs\" x=\"-111\" y=\"-57\"><field name=\"MODE\">WHILE</field><value name=\"BOOL\"><block type=\"logic_compare\" id=\",9Ecx14=Kz.Dz]x!s=Kl\"><field name=\"OP\">GT</field><value name=\"A\"><block type=\"variables_get\" id=\"y!]MEz?Z8X.HB]0f`P_a\"><field name=\"VAR\">TotalComido</field></block></value><value name=\"B\"><block type=\"variables_get\" id=\"T@[}~QDM~U3{*=Wua_.B\"><field name=\"VAR\">TotalTrozos</field></block></value></block></value><statement name=\"DO\"><block type=\"variables_set\" id=\"A!uez(A[ZKZ|8@|DSth%\"><field name=\"VAR\">TotalTrozos</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"gjK:Z9tyBbL.NK[2Rc~p\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"rmgtuwwk=_*[]P{VdA(A\"><field name=\"TEXT\">¿Total de trozos de pasteles?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"HUk?`a)CPj#`!yMmTS~u\"><field name=\"VAR\">TotalComido</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"375Nm!yA_+@tL+|FmSux\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"0Mp|~n64.o]2S+AathR;\"><field name=\"TEXT\">¿Trozos de pasteles  comidos?</field></shadow></value></block></value></block></next></block></statement><next><block type=\"variables_set\" id=\"C75Ob2(im8wQlcnwajK8\"><field name=\"VAR\">Quedan</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"%+c8[{0:G[pZAnD`oS2e\"><field name=\"OP\">MINUS</field><value name=\"A\"><shadow type=\"math_number\" id=\"5cDqKV!,Fz0SZ.Utv,pH\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"v*qrjD3S.-^WgD0[|mEv\"><field name=\"VAR\">TotalTrozos</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"GL5RBF)rM{HQ,Cp1ML9m\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"k?rx9Us`aSL?3ug0UW63\"><field name=\"VAR\">TotalComido</field></block></value></block></value><next><block type=\"controls_if\" id=\"k]p17WqO2TfYS5h1dLVd\"><value name=\"IF0\"><block type=\"logic_compare\" id=\";GG==Ex!6Y~D{zSO/uF_\"><field name=\"OP\">GT</field><value name=\"A\"><block type=\"variables_get\" id=\"LJ;ASJSoC5FIIM#BS]7`\"><field name=\"VAR\">TotalTrozos</field></block></value><value name=\"B\"><block type=\"variables_get\" id=\"AM6zKJo8/6M-HyGj^we6\"><field name=\"VAR\">TotalComido</field></block></value></block></value><statement name=\"DO0\"><block type=\"text_console\" id=\"TP_@a)wb@U7va~Id4V%*\"><value name=\"CONSOLE\"><block type=\"text\" id=\"j/jQ5*kugYW-VitNY?1W\"><field name=\"TEXT\">Si quedan trozos</field></block></value><next><block type=\"text_console\" id=\"%LL~-]h1y`a,9Zd9?g{a\"><value name=\"CONSOLE\"><block type=\"variables_get\" id=\"ry8gK#U*/g/5=sIkhD9*\"><field name=\"VAR\">Quedan</field></block></value></block></next></block></statement></block></next></block></next></block></xml>', '2018-07-10 20:03:39', '2018-07-10 20:03:39'),
(68, 52, 34, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2018-07-25 18:56:13', '2018-07-25 18:56:13'),
(69, 22, 50, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\";qs^4Mi[WRJ[5D(jhndu\" x=\"-30\" y=\"25\"><value name=\"CONSOLE\"><block type=\"text\" id=\"dihT%Fr_5+h%8tSxAj;^\"><field name=\"TEXT\">Hola bienvenido, dime tu nombre</field></block></value><next><block type=\"variables_set\" id=\"IMDE8NubJb(B:hpg}sTi\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"^OO]+5l^k#I?hIG!35qJ\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"HH#VHL|?Hj{4]8]SMAuD\"><field name=\"TEXT\">Escribe aquí tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"aKZEHI|!p#:|s^cvHK*t\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"|/q+Tv3yM*6D6(wIlZn-\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"ex]K3o%{u=%0@7qKk,|I\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"@lps(??U[LM/F]Pkhs9S\"><field name=\"TEXT\"> ven a mi cumpleaños =)</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:06', '2018-12-20 18:05:06'),
(70, 22, 42, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"13~;7%_KE3]+GZK4,r8@\" x=\"-26\" y=\"-666\"><value name=\"CONSOLE\"><block type=\"text\" id=\".Oo|Qyj]8PQ|^])4OQ:/\"><field name=\"TEXT\">Hola... te invito a comer chunchules, dime tu nombre</field></block></value><next><block type=\"variables_set\" id=\"t%H^IgxxvAjNR?=|=g@f\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"4QKDBnI/KXPD,;6u1sc-\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"(-4U969@)KybA-{C*;!.\"><field name=\"TEXT\">nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"A^Ga(7yG17w[53|kc=f2\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"-xa/s0d+DOs0,/5)*~pM\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"b(^R;},,aN*f1A9YgBm}\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"u./P-WEl]y/WBJwsnUC.\"><field name=\"TEXT\">Trae las bebidas</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:08', '2018-12-20 18:05:08'),
(71, 22, 39, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"Q.Oxm.+SXq56nL-e==hu\" x=\"7\" y=\"46\"></block><block type=\"text_console\" id=\"]I]^9Yg^{q6hYM79(sC[\" x=\"38\" y=\"50\"><value name=\"CONSOLE\"><block type=\"text\" id=\"cdjq})iHVwo}+L~1;l/Y\"><field name=\"TEXT\">¡hola bombóm! ¿cómo te llamas?</field></block></value><next><block type=\"variables_set\" id=\"APZ~5^oyiPb{d!`78=C?\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"gwCGV!H;02^_|!@|MVS#\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"X}mq1qeBRm~(W%yg~66h\"><field name=\"TEXT\">escribe aquí tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\";dIU]H(0G,.k?4Mt5?o}\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"NW:SUZll_!Y0.5L4qkKG\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"JDbO(l~lAoIgM7dbos~`\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"Ze)~]3l@XUtD^b4bopKJ\"><field name=\"TEXT\">¡Mi fiesta no será la misma sin ti, por eso te invité !</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:06:22', '2018-12-20 18:06:22'),
(72, 22, 47, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"^g`/5R,~A[k?iKWSEE)#\" x=\"-327\" y=\"-208\"><value name=\"CONSOLE\"><block type=\"text\" id=\"v_1)`~ir.#+1]q~ue+FX\"><field name=\"TEXT\"> Bienvenido, dime tu nombre y recibirás una linda invitación</field></block></value><next><block type=\"variables_set\" id=\"9g=?!#~:*xiqkQ^MJN#f\"><field name=\"VAR\">Fernando</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"BgRMlEyN!U*)]K*XvdOw\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"2r1[y5!2]a6,|Fq#39zH\"><field name=\"TEXT\">el nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\",+cnX:Dw%.A:aF]~cifk\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"`.~8p0x0}o30kq:23qz:\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"7ylQ=b5T;Vl=WAO|f8J-\"><field name=\"VAR\">Fernando</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"v}/Sc3zn*Qh5)Zk![:{1\"><field name=\"TEXT\">Te espero en mi casa para celebrar mi cumpleaños</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:09', '2018-12-20 18:05:09'),
(73, 22, 45, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"|Bg]r6usM:vQiTXbU,@5\" x=\"9\" y=\"180\"><value name=\"CONSOLE\"><block type=\"text\" id=\"C%?Np6C3+[|D.jr%Q{Vt\"><field name=\"TEXT\">Te invito cordialmente a celebrar el cumpleaños de Pedrito.</field></block></value><next><block type=\"variables_set\" id=\"DFP.{)^qh_v=lDf=idX0\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"g-bkFXd=Y9GToQI|Aq0X\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"_.a:uqAEMl({R95:Xnqk\"><field name=\"TEXT\">¿Por favor dinos tu nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"Xn8hu0ERdEPX)(bGTG/(\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"LEXQ!,u.Q4A;3RKME@FY\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"a/1Pa~#3,BQuw2Wav_k6\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"VWve{Xi/:=Z;VeEjCJ-q\"><field name=\"TEXT\">Te esperamos en nuestra casa a las 16: 00 hrs.</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:13', '2018-12-20 18:05:13'),
(74, 22, 43, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"%usHipoIQMIDpWI!lww-\" x=\"29\" y=\"72\"><value name=\"CONSOLE\"><block type=\"text\" id=\"hoJ{q,:X|ZU4[`dlq1D#\"><field name=\"TEXT\">hola, bienvenido, dime tu nombre</field></block></value><next><block type=\"variables_set\" id=\"!SMf~mgC!fp`Ww,QyR4e\"><field name=\"VAR\">susana</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"={TuBpB[V%b0@kxmS-^E\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"p)4x??jBPIz1e}%/F=wK\"><field name=\"TEXT\">Susana</field></shadow></value></block></value><next><block type=\"text_console\" id=\"odRd#=xOXgMh`z#s_o!y\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\":`KiV,fUSsjZnj06KI0]\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\";^Qo{~Zgp?vYIv=@?,K_\"><field name=\"VAR\">susana</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"4RV5O5gtNS[SCf0zM%E(\"><field name=\"TEXT\">Ven a mi cumplaños</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:18', '2018-12-20 18:05:18'),
(75, 22, 44, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"tiP?fgoHwFE(UYE{Zd8T\" x=\"40\" y=\"24\"><value name=\"CONSOLE\"><block type=\"text\" id=\"`a.?ZdMa2c[`*W-+2(qy\"><field name=\"TEXT\">Hola, te  invito a comer a mi casa, me dices tu nombre?</field></block></value><next><block type=\"variables_set\" id=\"%_GG;[w=Z3MP6R`h:i2;\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\",mR1BsC}`;S7fjV`Xef|\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"[Gx)iM-DiYJ+sKc.!n.4\"><field name=\"TEXT\">escribe aquí tu nombre</field></shadow></value></block></value><next><block type=\"text_console\" id=\"o?7N0Rcf*{ul!1[[},{C\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"uDiY~]};=1PB0j*6sLHj\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"0y;P@{.E_hE07gsoGnKk\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"d/^S:bn|se8Prg}3E]1D\"><field name=\"TEXT\">Bienvenido a mi casa</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:23', '2018-12-20 18:05:23'),
(76, 22, 48, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"a:Va{qmG.X[jvk;7PwM#\" x=\"63\" y=\"88\"><value name=\"CONSOLE\"><block type=\"text\" id=\"*EqM,nKEO3HTHi))NOa.\"><field name=\"TEXT\">hola bienvenidos!!! cual es tu nombre?</field></block></value><next><block type=\"variables_set\" id=\"tHaFiA?1u};MPDQfG@VG\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\")dAz1XRm2:wW4Z]%7T7n\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"8VcKNYzcE}iL=^+/h-U{\"><field name=\"TEXT\">nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"W+ym0]uut[m#:T3+})FV\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"g)6P[8zRYC-~{W#8,.xu\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"Y5Oy^`pjcg?kgbp,-y*S\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"KcPsi41NKm(mymU{|S8z\"><field name=\"TEXT\"> te invito a mi cumpleaños</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:46', '2018-12-20 18:05:46'),
(77, 22, 40, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"pk6sdu51+*Jm,kzxi^:*\" x=\"18\" y=\"52\"><value name=\"CONSOLE\"><block type=\"text\" id=\"Pls+@Wg{T1g]G@x`@*E#\"><field name=\"TEXT\">Hola te invito a un carrete</field></block></value><next><block type=\"variables_set\" id=\"l?OPaR=EIAIx%_wuU_]-\"><field name=\"VAR\">Nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"fsGRCL/,[E%_DAT-ODw.\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"+}pP2sJ-Z_gRT=(]/{+^\"><field name=\"TEXT\">¿Cual es tu nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"tI7gTgjv1)pu*+ns+rJt\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"%h7m#KDIK^,j625Ug}9*\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\":Ey]IR+_I~R71)Chms!o\"><field name=\"TEXT\">Hola</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"]VvC`~ql@:XgLtLn1f=G\"><field name=\"VAR\">Nombre</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:51', '2018-12-20 18:05:51'),
(78, 22, 49, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"}jJUNs9!^siK0h6H9tm3\" x=\"9\" y=\"53\"><value name=\"CONSOLE\"><block type=\"text\" id=\"nk0XxJpi^0?PT.0x*B1p\"><field name=\"TEXT\">Holaaa Bienvenido! ¿Cuàl es tu nombre?</field></block></value><next><block type=\"variables_set\" id=\"*rt1:mN;:u_T:4xDi+*,\"><field name=\"VAR\">nombre</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"%4CXbO/UwPbVPJTwD,98\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"_ZX22ItqUhs]A3:0E=a]\"><field name=\"TEXT\">¿Cuàl es tu nombre?</field></shadow></value></block></value><next><block type=\"text_console\" id=\"N.[aQegF@ruiZIBECyBk\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"t8;4e+UWM-:-ONZVhek#\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"D!@OJq%*EapG6@0,3skB\"><field name=\"VAR\">nombre</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"_jpxnM?/`p]O!wZg,`)Z\"><field name=\"TEXT\"> te esperamos a la cena de fin de año</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:05:59', '2018-12-20 18:05:59'),
(79, 22, 46, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"S:mU?J*pD*:4MsZQ#sj9\" x=\"-387\" y=\"-255\"><value name=\"CONSOLE\"><block type=\"text\" id=\"jk{lbr:p}cBg7S(8Thw,\"><field name=\"TEXT\">HOla te invito a una velada especial!!! :) ¿Cómo te llamas?</field></block></value><next><block type=\"variables_set\" id=\"XD.%FP+@sY3`1_*~7?d_\"><field name=\"VAR\">Carmen Gloria</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"DAlZhI=S(ap#Lvh{u_{G\"><mutation type=\"TEXT\"></mutation><field name=\"TYPE\">TEXT</field><value name=\"TEXT\"><shadow type=\"text\" id=\"0Tuc)`vk3s7WOhUAbTKs\"><field name=\"TEXT\">Escribe aquí tu nombre </field></shadow></value></block></value><next><block type=\"text_console\" id=\"2!PER-gG_ng|-DVC0BpL\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"xjr4ZF~r0/x.?8GYdq}#\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"variables_get\" id=\"V]m0BGx]1CEk;QPneNOv\"><field name=\"VAR\">Carmen Gloria</field></block></value><value name=\"ADD1\"><block type=\"text\" id=\"tiH.9l]8HwpCbJL;0G|Q\"><field name=\"TEXT\">Bienvenida un agrado tenerte aquí!!!</field></block></value></block></value></block></next></block></next></block></xml>', '2018-12-20 18:06:03', '2018-12-20 18:06:03');
INSERT INTO `blockly_activity_answers` (`id`, `activity_id`, `student_id`, `value`, `created_at`, `updated_at`) VALUES
(80, 25, 48, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"X8_3c5~ap}^)reu8ki8x\" x=\"9\" y=\"53\"><value name=\"CONSOLE\"><block type=\"text\" id=\"72|[[ML6R(J|7R[ar3)I\"><field name=\"TEXT\">¿cuanto pastel comeran?</field></block></value><next><block type=\"variables_set\" id=\"tXP{Q3GQ5b-|Vo(Fx48,\"><field name=\"VAR\">amigo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"A3EXv2a+Q%gEPMJM42pb\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"sx1h-]N.g-?YOgzVk:?r\"><field name=\"TEXT\">amigo 1 ¿cuanto comeras?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"WBwH3no8di{LjLXVsJ2x\"><field name=\"VAR\">amigo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"B?sf-_ReuF.=XPQcfWG,\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"1AvXr8OtSKLkCx,xk5C~\"><field name=\"TEXT\">amigo 2 ¿cuanto comeras?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"dgp=N+%GDPVT/RuJ%CJr\"><field name=\"VAR\">amigo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"tE%D?b1zlp-;kw`)6-?W\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\")Em0Psx5Uvxx4aCwGKPR\"><field name=\"TEXT\">amigo 3 ¿cuanto comeras?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"rtvHyL_?C5t~sQNJ/0Sb\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"]Dz.*|BDBiHwOH=gctUy\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"kU.Ol-.TO{HJI=vWB(_=\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"V98gjRGwUvQ)Z^xn]p^p\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"r+kWfX?WQ!3A?1+^7hVx\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"!10|VJ71(2S^L1/qup?9\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Ah)bjPPAphZ{lIC:Itc(\"><field name=\"NUM\">2</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"b|#=;9XLT;(tb*fZAH/E\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"lMs6Xkl|.z1(X0V`fM_w\"><field name=\"VAR\">amigo 3</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"Ne1M?xMWzGc_*V8#vU0y\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Uge75Nif^JJ?)x/d?!YD\"><field name=\"VAR\">amigo 2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"GGI{PK#}S?`wq^;sH7Z2\"><field name=\"NUM\">2</field></shadow><block type=\"variables_get\" id=\"o9C)8/-mk%WKrQCt7rZ4\"><field name=\"VAR\">amigo 1</field></block></value></block></value><next><block type=\"text_console\" id=\"o7V)JO:04+_Y|W?fN4hJ\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"d;:oqdk?d:%G`~~X=.r8\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"{dPfB[HQC99u*j!c]6*A\"><field name=\"TEXT\">el total de trozos es:</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"k59MZsnPBrV,a6ay}hWF\"><field name=\"VAR\">trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:43:01', '2018-12-20 18:43:01'),
(81, 25, 50, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"R}30OQiEX5AVkc9s1vTV\" x=\"-20\" y=\"21\"><value name=\"CONSOLE\"><block type=\"text\" id=\"RwRMMAOQ*uwII`ofa[Gx\"><field name=\"TEXT\">¿Cuántos trozos van a comer?</field></block></value><next><block type=\"variables_set\" id=\"(`{~:7RI[SfAo,f!!t}6\"><field name=\"VAR\">amigo01</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Ib=Ys;Pzh4ybslrhRxeI\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"*MIXVVCKb-z-l%[W*u`o\"><field name=\"TEXT\">Amigo 1, cuanto comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Xu36*RV/r(bxmA;(_+B)\"><field name=\"VAR\">amigo02</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"?SQC4`?`Kd)5*sc5JYM2\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"^Nt`m11-]}!%A0+/{2:U\"><field name=\"TEXT\">Amigo 2, cuanto comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"jmF%4/^2qd5BQu%sO-|d\"><field name=\"VAR\">amigo03</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\";;Esyx2sZ?2CH2N8W_a:\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"EatN:Z)XnAh{MJS%taYy\"><field name=\"TEXT\">Amigo 3, cuanto comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"xvX18dIw+qmKI32F?fMv\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"#uHoK#py]Zn7_+Z#^IwA\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"+]M?qtGnUmw^,]9MB8s8\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\".8D:fP;-/UODDo3}ucE.\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"p6kM/OsqRoeueyy3wz?6\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"szhSUR{DqrSaFBrGw|1:\"><field name=\"VAR\">amigo01</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"-?K~O=;dX(VLL_C5ZE,)\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\".8bw/`fz%~tfIaZM_eqe\"><field name=\"VAR\">amigo02</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"dg/]R%ALZR*b1]+v]0#}\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"Lqw+AaE4HatA-nH`c_.P\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"(gU0ZAhowB2PRW71Iyq8\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"6LpB=Ybps[rcTjecs(;,\"><field name=\"VAR\">amigo03</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"Xc`Rchn~9Y%%~W!N|D{q\"><field name=\"NUM\">7</field></shadow></value></block></value></block></value><next><block type=\"text_console\" id=\"d2!JEv)nyAI+iAh:sdmO\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"lv!_Xr{;,x*IU3a6=)cn\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"reB5NK^@rC)aFatyF+^(\"><field name=\"TEXT\">El total de trozos es:</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"m=g.~tYZ`Wp@KWH%Vl]7\"><field name=\"VAR\">trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:45:42', '2018-12-20 18:45:42'),
(82, 25, 39, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"a83)N~KyW^~Z|d?McpkC\" x=\"120\" y=\"-58\"><value name=\"CONSOLE\"><block type=\"text\" id=\"8S5Oqnw^8alJsxuEZavb\"><field name=\"TEXT\">Necesito que respondas cuántos trozos de  pastel comeras</field></block></value><next><block type=\"variables_set\" id=\"M?KMKwjVD?~{)htRnOoZ\"><field name=\"VAR\">amigo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"V%H-DR~K=e;:4tZRro2*\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"{]m;%`S_),29Q|(Z|=T2\"><field name=\"TEXT\">señala el número de trozos que eres capaz de comerte</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"=;m//yE`AVX;g-OlM?o8\"><field name=\"VAR\">amigo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"`prDNZ}IjgsdVjsA},a1\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"IUx-V^^eF]u+ii_X4nAk\"><field name=\"TEXT\">señala el número de trozos que eres capaz de comerte</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Q/qGbe#hgS8Lj5=~Da6p\"><field name=\"VAR\">amigo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"nO5FdAo4qe#v{+!(GZyA\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"f!%a{wASt[o9QX5/}IbN\"><field name=\"TEXT\">señala el número de trozos que eres capaz de comerte</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"sipEW(nWP-:kyu{C^F}(\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"zf6KWwm-5SC=6cL4hbZr\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Gj~I54~gIrFeHqi28+c~\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\")!3xH[Xqw]Y2.~K_lhMG\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"7Amrl[vDYp_OmR9hxqRz\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"MJk3jevbSnB]qfUq2Yrg\"><field name=\"VAR\">amigo 1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"1IF:_^Q3{-./b`]18-c[\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"}^D1E-}]at]qq8[kz*bW\"><field name=\"VAR\">amigo 2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"MVAxb*R8`7=(HfGY1^gx\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"2.=%vGO#Yj4wIgFH722/\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"IK:n3Gy3O:GtUU({9c2K\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"5Z)w8ekL5Wk#/(Q*UqTF\"><field name=\"VAR\">amigo 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"-.H@RcH0;Rg_4X5N-uPf\"><field name=\"NUM\">1</field></shadow></value></block></value></block></value><next><block type=\"text_console\" id=\"*dI^W52XVutXpMj.%}k[\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"8|79m:#0s8J=L)3DH,d~\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"ZOq,d~eHe|gibHoFXM|D\"><field name=\"TEXT\">El total de trozos es </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"bx[q/i+yz,.f6-inbF-d\"><field name=\"VAR\">trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:45:44', '2018-12-20 18:45:44'),
(83, 25, 47, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"y9g_!`Z5KQCZX`aVC4r{\" x=\"-358\" y=\"-220\"><value name=\"CONSOLE\"><block type=\"text\" id=\"p0|;10V~`p1AabNs0PX9\"><field name=\"TEXT\">Tendré una rica torta ¿Cuantos trozos comerás?</field></block></value><next><block type=\"variables_set\" id=\"F*t{`PLzT|%iTfE%hahX\"><field name=\"VAR\">fernando</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"I%`TcP*h^SVu%C*HHK@O\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"?R(ffJcJ:`@OwP8-`pXD\"><field name=\"TEXT\">¿Cuantos comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"!-}J(y3P{C(8HOMEIunl\"><field name=\"VAR\">Fiorella</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"=ViD9d)0h4@bDiXhB.i{\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"/VuE~hu^EqRXlzE3_1^=\"><field name=\"TEXT\">¿Cuanros comerás</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"p62;Tn.@/7-{9I}4uIG)\"><field name=\"VAR\">Carmen</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"cG{tY*8k?Q.G=;;e5WYZ\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"-r2Y8,aCrC{#fK3jMt4n\"><field name=\"TEXT\">¿Cuantos comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"7V3j7V~bs~{YP!~S^~PR\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"YRNnJ!IZEMl#8-b]V]@6\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"DUi0Tan=EE]wrVl1H:_y\"><field name=\"NUM\">2</field></shadow><block type=\"variables_get\" id=\"41C^-dq!*Brl{=`Yv3p:\"><field name=\"VAR\">fernando</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"QOAVz|^JK)D?)JSExLa6\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"H)W|0i==ouUl-#-qZm]]\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Kow7{b3Dn1Faluum:+dp\"><field name=\"NUM\">3</field></shadow><block type=\"variables_get\" id=\"Wc`0d1D~NO~EKv1}PPxh\"><field name=\"VAR\">Fiorella</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"iC0;x##Z=%^,z`{nPw[i\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\":*Ds0Mkv6|JpBwHH;M|w\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"2@Vr120F?qt3vB##=%,k\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"/48mB9:2%b]q48lgCJ1[\"><field name=\"VAR\">Carmen</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"]o:r~2G=e8%A6KKBm;XO\"><field name=\"NUM\">1</field></shadow></value></block></value></block></value></block></value><next><block type=\"text_console\" id=\",1hpn#r@qOuxDjLIQ7~X\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"-#LE8/(Pc+rL.E21`+Mx\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\".7]rHkl/*qLnUPxM)pL{\"><field name=\"TEXT\">El total de trozos es</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"65TDmjx`EBj0avm9pafG\"><field name=\"VAR\">trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block><block type=\"variables_set\" id=\":JH{eBw6!B!vgB!V1P8S\" x=\"-207\" y=\"-124\"><field name=\"VAR\">fernando</field></block></xml>', '2018-12-20 18:45:45', '2018-12-20 18:45:45'),
(84, 51, 50, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2018-12-20 18:46:10', '2018-12-20 18:46:10'),
(85, 25, 46, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"68Q:wIa|V{u:@jZ46:~w\" x=\"58\" y=\"29\"><value name=\"CONSOLE\"><block type=\"text\" id=\"A:k8`3f,j^pIm+!fXLk)\"><field name=\"TEXT\">¿Cuántos trozos quieres comer?</field></block></value><next><block type=\"variables_set\" id=\"JWMjh=PeNDi7-*!iGCm/\"><field name=\"VAR\">Amiga 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Qp}?u/kJcU8D@s++c?2R\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"5gs~ESdj.Rd/#40Pf[v%\"><field name=\"TEXT\">Carmen Gloria cuanto comerás  3</field></shadow></value></block></value><next><block type=\"variables_set\" id=\",?*zS73]2zJ7U1/5}5xo\"><field name=\"VAR\">Amiga 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\":3tf/(/C.iYWShRYf!-9\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"/+TdjiZQQ~o_-D3AMN,M\"><field name=\"TEXT\">Juanita  cuanto comerás  2</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Ze!itmAzAF39O4Hog06l\"><field name=\"VAR\">Amiga 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\";x}MfoaotPZeM`nvTtKe\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"iPX~dz)(2j3oOKKx.7?p\"><field name=\"TEXT\">Pedrita cuanto comerás 1</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"NPcSdYfO53CG+Fwv=k}y\"><field name=\"VAR\">Trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"GSY5oYNvtA3DpXSvU[6B\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"zVWL=E}yMn[r}s5OoAXv\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"Tm3L-aN,t?nT`^.|RY3L\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"[^NDu^h{ux6{RVrYETzk\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Gtx]^aQ`bm_z7[!)9H@0\"><field name=\"VAR\">Amiga 1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"z_NiLS6x(6k42n=)}-hf\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"?g,30w,tWSl=U1d%wr{5\"><field name=\"VAR\">Amiga 2</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\".NDGVfA_!^L-[=7?Wu|k\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"U{L*z{GTw,t[+l|NN}Lx\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Hgh2t}bPNxhYF3)sn)E2\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"i6Qjua|9FfqrL]_0jLVW\"><field name=\"VAR\">Amiga 3</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"V2*!26YU}I8BGqhr+Wfx\"><field name=\"NUM\">1</field></shadow></value></block></value></block></value><next><block type=\"text_console\" id=\"y;Z63O),7#48a.jxcX#j\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"xjf:5B|{b){6)ruCfg^i\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"Z4#w~MBG9}rni}K:xCsB\"><field name=\"TEXT\">El total de trozos es </field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"WVP|!=R9)RBQD20@r.;e\"><field name=\"VAR\">Trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:47:32', '2018-12-20 18:47:32'),
(86, 23, 50, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2018-12-20 18:48:33', '2018-12-20 18:48:33'),
(87, 25, 40, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"9QbKiqXe45!j?*q){fM,\" x=\"88\" y=\"34\"><value name=\"CONSOLE\"><block type=\"text\" id=\"o-wyF-AoSf{dQ)JsuV(9\"><field name=\"TEXT\">¿Cuantos trozos vas a comer?</field></block></value><next><block type=\"variables_set\" id=\"f|=OT%90PKcxH)]NW6!?\"><field name=\"VAR\">Amigo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"IdgT2I2Aiz(+-=M3y8k^\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"4]%,-C^@ZSy*|:1l/A(y\"><field name=\"TEXT\">¿Cuanto comeras?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"Wnu}Bg0r--|W3J}3Rhp{\"><field name=\"VAR\">Amigo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"Z+NcMF|l}#6:8|4Cn8.U\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"V@Cx-0/gqa6G-pM!W;yn\"><field name=\"TEXT\">¿Cuanto comeras?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"2[E),H2qnYR,isY^|m9u\"><field name=\"VAR\">Amigo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"#`#|NR/2?)d%(`({BVNI\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"e?.D9/y;JGQzb,v.lyBN\"><field name=\"TEXT\">¿Cuanto comeras?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"ur_F+x8Xkv28v(pmxi6K\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"8P.RFxGCkRX{`A*@g0G^\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"fLsr^rhOw@|wdjlwgaa}\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\".IWS+,e=e)cy1Se*[GHe\"><field name=\"VAR\">Amigo 1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"|w.g?28Er%xa|~kbGAB`\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"0}3pkNFo/CUr_Tm4BWia\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"su9eytKoz*O6oFCMeK.,\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\":rq.(=vz}sM!7x`s_A?=\"><field name=\"VAR\">Amigo 2</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"!MrlTKV!rI2Oo1~U?PYU\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"p8M}Z}!!ecfhi[[kZ3P/\"><field name=\"VAR\">Amigo 3</field></block></value></block></value></block></value><next><block type=\"text_console\" id=\"r]W_h0h-?fYQB3O#N4~W\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"h}h@rq6^CEV*~[7Hdr30\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"z7]5z,3U@anEc}F4LFH=\"><field name=\"TEXT\">los trozos son</field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"aCJ(N9SlF^zFcRMzGQs7\"><field name=\"VAR\">trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:49:09', '2018-12-20 18:49:09'),
(88, 51, 48, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2018-12-20 18:50:02', '2018-12-20 18:50:02'),
(89, 25, 43, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"2JGL(DpB%{jwWT?)~N^(\" x=\"57\" y=\"103\"><value name=\"CONSOLE\"><block type=\"text\" id=\"1`73~oQuq|1|CVUQr@/z\"><field name=\"TEXT\">¿cuantos trozos van a comer</field></block></value><next><block type=\"variables_set\" id=\"X0ej*wqIjGkgl*YLHdca\"><field name=\"VAR\">amigo2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"H*WA,JoY6eZO@X)}d6+V\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"P}}Vo[CvRRDj.)f^gF4r\"><field name=\"TEXT\">amigo 1, cuantos  trozos comeras</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"T(O{)?D4oESJJ`Mnm~_N\"><field name=\"VAR\">amigo2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"rfn!Ai[1v({T7|xut3=}\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"k|ij6,_i=Y%avtM{~*#u\"><field name=\"TEXT\">amigo2, cuantos trozos comeras</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"?3Ak{JiR%,#I19b)|I]t\"><field name=\"VAR\">amigo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"KwRLmrNVXifp*1^w[`AG\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"I7,v1,FKX[ah8S[uCGE:\"><field name=\"TEXT\">amigo 3, cuantoa trozos comeras</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"CgR}j[BQth2o*^)#BWwM\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"K[|w#o{jn;Z8+dB,|ngD\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"2r:LWQ0II3p7GqO9]2gl\"><field name=\"NUM\">3</field></shadow><block type=\"variables_get\" id=\";HzN:MGP:o*wLrtMQb~I\"><field name=\"VAR\">amigo1</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"O-l{^7!pJE[0|E5B}`{F\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"8+}?b8SfDQVeK^33KNu#\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"Yi5;~Dj3Iwy.Q92XiDr2\"><field name=\"NUM\">2</field></shadow><block type=\"variables_get\" id=\"DmS@oY%(3u]kQD*}(qe1\"><field name=\"VAR\">amigo2</field></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"%LT?m9Nngl=@r;aHr`X5\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"f8],`)ymRncvPH%zN(f[\"><field name=\"VAR\">amigo 3</field></block></value></block></value></block></value></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:52:14', '2018-12-20 18:52:14'),
(90, 25, 45, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"><block type=\"text_console\" id=\"bR.X4ZcK/zb|ps18Q{|n\" x=\"-70\" y=\"80\"><value name=\"CONSOLE\"><block type=\"text\" id=\"ya=%g8J@Zs|5qR-)zRPL\"><field name=\"TEXT\">¿Cuántos trozos van a comer?</field></block></value><next><block type=\"variables_set\" id=\"%|SbQ@N7,1b*-@i(/W|.\"><field name=\"VAR\">amigo 1</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"5!vGmD)bn}ct8+l:vlg1\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"_)5/8u.(/OoUD@wIi+0N\"><field name=\"TEXT\">amigo 1¿cuántos comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"-(H*/S(Fz7-cGf5u5Z_b\"><field name=\"VAR\">amigo 2</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"LP_z:*bgeMN)N5:XC0oU\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"*QP_U~:E8`tO2SDu:xQq\"><field name=\"TEXT\">amigo 2 ¿cuántos comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"-9,_GD)]^2=Y#vcZ+PxM\"><field name=\"VAR\">amigo 3</field><value name=\"VALUE\"><block type=\"text_prompt_ext\" id=\"1Obm(Q1T#qYrRr1I8W[Y\"><mutation type=\"NUMBER\"></mutation><field name=\"TYPE\">NUMBER</field><value name=\"TEXT\"><shadow type=\"text\" id=\"`BC%Wt@~*(=T:Hs)n}|d\"><field name=\"TEXT\">amigo 3 ¿cuántos comerás?</field></shadow></value></block></value><next><block type=\"variables_set\" id=\"H0.j]6Nk6c5(K1.d%CuO\"><field name=\"VAR\">trozos</field><value name=\"VALUE\"><block type=\"math_arithmetic\" id=\"6}iqW9a|i:zY#sWe.`^K\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"*%@A`Q[r`R!C|q+7A)4P\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"feqVuFu9Fdcxv!~xCvRl\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\",lDT_53FVM,a1OXi9V#Q\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"]XX1BFGOa2~?Kh=DJK*3\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"-S.2f-so/:=EFqofP.nO\"><field name=\"NUM\">1</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"jmlNu@{=HG5lme.JaNt4\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"dVJ%^rAeLwFznc%SRtoA\"><field name=\"VAR\">amigo 3</field></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"JR{g8x[S}.A|*rV|X5s2\"><field name=\"NUM\">1</field></shadow><block type=\"math_arithmetic\" id=\"T:6*Mjl1O}8,F~jP#a?S\"><field name=\"OP\">ADD</field><value name=\"A\"><shadow type=\"math_number\" id=\"2p11palAiVVgRF(eisWy\"><field name=\"NUM\">0</field></shadow></value><value name=\"B\"><shadow type=\"math_number\" id=\"l=5NEPm`@z,r}PGK+19t\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"Yb}Q^a3lgj1G!3U[{c+S\"><field name=\"VAR\">amigo 2</field></block></value></block></value></block></value><value name=\"B\"><shadow type=\"math_number\" id=\"TGLA7Kp?{WOuH8zMlahA\"><field name=\"NUM\">1</field></shadow><block type=\"variables_get\" id=\"gaF0mB0x-UaUPeP.](b8\"><field name=\"VAR\">amigo 1</field></block></value></block></value><next><block type=\"text_console\" id=\"=wib^[u*.VE:K:jMsDYh\"><value name=\"CONSOLE\"><block type=\"text_join\" id=\"J78d?QgN}+yaVSG^pDUu\"><mutation items=\"2\"></mutation><value name=\"ADD0\"><block type=\"text\" id=\"-voHYJ|7wTQMLCiH5BES\"><field name=\"TEXT\"></field></block></value><value name=\"ADD1\"><block type=\"variables_get\" id=\"-}D+?(D3qD/LFR)+ulGm\"><field name=\"VAR\">trozos</field></block></value></block></value></block></next></block></next></block></next></block></next></block></next></block></xml>', '2018-12-20 18:55:10', '2018-12-20 18:55:10'),
(91, 51, 39, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2018-12-20 18:55:43', '2018-12-20 18:55:43'),
(92, 51, 46, '<xml xmlns=\"http://www.w3.org/1999/xhtml\"></xml>', '2018-12-20 18:56:20', '2018-12-20 18:56:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `califications`
--

CREATE TABLE `califications` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `answere_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `score` int(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `califications`
--

INSERT INTO `califications` (`id`, `student_id`, `answere_id`, `activity_id`, `score`, `created_at`, `updated_at`) VALUES
(8, 2, 13, 1, 100, '2016-11-11 02:48:51', '2016-10-20 06:58:19'),
(9, 2, 14, 2, 100, '2016-11-11 02:48:55', '2016-10-20 06:58:35'),
(10, 2, 15, 3, 0, '2016-11-11 02:49:00', '2016-10-20 07:00:02'),
(11, 2, 16, 7, 100, '2016-11-11 02:49:05', '2016-10-20 07:28:53'),
(12, 2, 17, 9, 100, '2016-11-11 02:49:09', '2016-10-20 07:35:01'),
(13, 2, 18, 10, 60, '2016-11-11 02:48:32', '2016-10-20 07:35:23'),
(14, 2, 19, 11, 100, '2016-11-11 02:48:26', '2016-10-20 07:35:33'),
(15, 1, 10, 9, 100, '2016-11-11 02:48:20', '2016-10-25 03:17:46'),
(16, 1, 6, 1, 100, '2016-11-11 02:48:15', '2016-10-25 09:16:59'),
(17, 1, 2, 2, 100, '2016-11-11 02:48:05', '2016-10-25 09:17:38'),
(18, 1, 7, 3, 77, '2016-11-29 02:19:41', '2016-11-29 05:19:41'),
(19, 1, 1, 4, 100, '2016-11-29 01:53:58', '2016-11-29 04:53:58'),
(20, 1, 20, 5, 100, '2016-11-11 02:47:36', '2016-10-25 09:23:33'),
(21, 3, 21, 1, 100, '2016-11-11 09:26:58', '2016-11-11 09:26:58'),
(22, 1, 22, 6, 100, '2016-11-29 02:21:20', '2016-11-29 05:21:20'),
(23, 1, 8, 7, 0, '2016-11-29 05:21:30', '2016-11-29 05:21:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'StDominic', 'Colegio Saint Dominic', '2018-12-20 00:02:29', '2018-12-20 00:02:29'),
(2, 'QUM212', 'Química', '2016-11-11 05:13:01', '0000-00-00 00:00:00'),
(6, 'FMF125', 'Física', '2016-12-14 07:05:16', '2016-12-14 10:05:16'),
(7, 'MTM25', 'Estadistica', '2016-12-28 22:07:01', '2016-12-28 22:07:01'),
(8, 'TIR001', 'Clases TIR', '2017-05-25 01:13:30', '2017-05-25 01:13:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_inscriptions`
--

CREATE TABLE `course_inscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `course_inscriptions`
--

INSERT INTO `course_inscriptions` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 1, 5, '2016-12-14 09:28:56', '2016-12-14 09:28:56'),
(11, 2, 14, '2016-12-14 10:06:53', '2016-12-14 10:06:53'),
(12, 6, 15, '2016-12-14 10:06:55', '2016-12-14 10:06:55'),
(14, 6, 5, '2016-12-14 10:25:13', '2016-12-14 10:25:13'),
(18, 6, 4, '2016-12-15 06:31:20', '2016-12-15 06:31:20'),
(24, 6, 16, '2016-12-19 02:43:29', '2016-12-19 02:43:29'),
(25, 7, 5, '2016-12-28 22:07:15', '2016-12-28 22:07:15'),
(26, 7, 10, '2016-12-28 22:09:08', '2016-12-28 22:09:08'),
(27, 7, 4, '2016-12-28 22:09:09', '2016-12-28 22:09:09'),
(30, 1, 20, '2017-04-26 18:48:49', '2017-04-26 18:48:49'),
(31, 1, 21, '2017-04-26 18:48:50', '2017-04-26 18:48:50'),
(32, 1, 22, '2017-04-26 18:48:50', '2017-04-26 18:48:50'),
(33, 1, 23, '2017-04-26 18:48:52', '2017-04-26 18:48:52'),
(34, 1, 24, '2017-04-26 18:48:53', '2017-04-26 18:48:53'),
(35, 1, 25, '2017-04-26 18:48:54', '2017-04-26 18:48:54'),
(36, 1, 26, '2017-04-26 18:48:54', '2017-04-26 18:48:54'),
(37, 1, 27, '2017-04-26 18:48:55', '2017-04-26 18:48:55'),
(38, 1, 28, '2017-04-26 18:48:56', '2017-04-26 18:48:56'),
(39, 1, 29, '2017-04-26 18:48:57', '2017-04-26 18:48:57'),
(40, 1, 30, '2017-04-26 18:48:57', '2017-04-26 18:48:57'),
(41, 1, 31, '2017-04-26 18:48:57', '2017-04-26 18:48:57'),
(42, 1, 32, '2017-04-26 18:48:58', '2017-04-26 18:48:58'),
(43, 1, 33, '2017-04-26 18:48:59', '2017-04-26 18:48:59'),
(44, 1, 34, '2017-04-26 18:48:59', '2017-04-26 18:48:59'),
(45, 1, 35, '2017-04-26 18:49:00', '2017-04-26 18:49:00'),
(46, 1, 36, '2017-04-26 18:49:01', '2017-04-26 18:49:01'),
(47, 1, 37, '2017-04-26 18:49:04', '2017-04-26 18:49:04'),
(48, 1, 38, '2017-04-26 18:49:04', '2017-04-26 18:49:04'),
(49, 1, 39, '2017-04-26 18:49:05', '2017-04-26 18:49:05'),
(50, 8, 42, '2017-05-25 01:22:56', '2017-05-25 01:22:56'),
(51, 8, 41, '2017-05-25 01:22:57', '2017-05-25 01:22:57'),
(52, 8, 43, '2017-05-26 00:39:47', '2017-05-26 00:39:47'),
(53, 8, 44, '2017-05-26 00:42:17', '2017-05-26 00:42:17'),
(54, 8, 45, '2017-05-26 02:03:21', '2017-05-26 02:03:21'),
(55, 8, 46, '2017-05-26 02:03:22', '2017-05-26 02:03:22'),
(56, 1, 48, '2017-07-06 17:44:44', '2017-07-06 17:44:44'),
(58, 1, 50, '2018-07-10 18:47:55', '2018-07-10 18:47:55'),
(59, 1, 51, '2018-07-10 18:47:56', '2018-07-10 18:47:56'),
(60, 1, 54, '2018-12-20 00:01:30', '2018-12-20 00:01:30'),
(61, 1, 55, '2018-12-20 00:01:31', '2018-12-20 00:01:31'),
(62, 1, 56, '2018-12-20 00:01:32', '2018-12-20 00:01:32'),
(63, 1, 57, '2018-12-20 00:03:11', '2018-12-20 00:03:11'),
(64, 1, 58, '2018-12-20 00:13:42', '2018-12-20 00:13:42'),
(65, 1, 59, '2018-12-20 00:13:43', '2018-12-20 00:13:43'),
(66, 1, 60, '2018-12-20 00:13:44', '2018-12-20 00:13:44'),
(67, 1, 61, '2018-12-20 00:13:46', '2018-12-20 00:13:46'),
(68, 1, 62, '2018-12-20 00:13:46', '2018-12-20 00:13:46'),
(69, 1, 63, '2018-12-20 00:13:47', '2018-12-20 00:13:47'),
(70, 1, 64, '2018-12-20 00:13:48', '2018-12-20 00:13:48'),
(71, 1, 65, '2018-12-20 00:13:49', '2018-12-20 00:13:49'),
(72, 1, 66, '2018-12-20 00:13:49', '2018-12-20 00:13:49'),
(73, 1, 67, '2018-12-20 00:13:51', '2018-12-20 00:13:51'),
(74, 1, 68, '2018-12-20 00:13:51', '2018-12-20 00:13:51'),
(75, 1, 69, '2018-12-20 17:02:11', '2018-12-20 17:02:11'),
(76, 1, 70, '2018-12-20 17:34:07', '2018-12-20 17:34:07'),
(77, 1, 4, '2020-09-23 20:17:34', '2020-09-23 20:17:34'),
(78, 1, 1, '2020-09-23 20:56:46', '2020-09-23 20:56:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_activity_link`
--

CREATE TABLE `group_activity_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `group_activity_link`
--

INSERT INTO `group_activity_link` (`id`, `group_id`, `activity_id`, `created_at`, `updated_at`) VALUES
(5, 1, 1, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(6, 1, 2, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(7, 1, 3, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(8, 1, 4, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(9, 1, 5, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(10, 2, 6, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(11, 2, 7, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(12, 2, 8, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(13, 2, 9, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(14, 3, 10, '2016-10-25 05:08:26', '0000-00-00 00:00:00'),
(15, 4, 11, '2016-10-25 05:08:35', '0000-00-00 00:00:00'),
(16, 5, 12, '2016-11-11 09:23:51', '2016-11-11 09:23:51'),
(17, 6, 13, '2016-11-11 17:16:31', '2016-11-11 17:16:31'),
(18, 21, 14, '2016-12-19 03:13:38', '2016-12-19 03:13:38'),
(19, 23, 15, '2016-12-19 03:57:58', '2016-12-19 03:57:58'),
(20, 1, 16, '2016-12-28 22:11:58', '2016-12-28 22:11:58'),
(21, 25, 17, '2017-04-10 17:48:50', '2017-04-10 17:48:50'),
(22, 26, 18, '2017-04-10 17:54:25', '2017-04-10 17:54:25'),
(23, 27, 19, '2017-04-10 17:54:32', '2017-04-10 17:54:32'),
(24, 28, 20, '2017-04-10 17:54:35', '2017-04-10 17:54:35'),
(25, 28, 21, '2017-04-10 17:54:59', '2017-04-10 17:54:59'),
(26, 29, 22, '2017-04-25 17:45:36', '2017-04-25 17:45:36'),
(27, 31, 23, '2017-04-25 17:49:39', '2017-04-25 17:49:39'),
(29, 30, 25, '2017-04-25 17:50:47', '2017-04-25 17:50:47'),
(30, 32, 26, '2017-04-25 17:54:47', '2017-04-25 17:54:47'),
(37, 33, 33, '2017-05-25 01:27:36', '2017-05-25 01:27:36'),
(39, 37, 35, '2017-05-25 01:28:20', '2017-05-25 01:28:20'),
(40, 34, 36, '2017-05-25 01:42:53', '2017-05-25 01:42:53'),
(43, 41, 39, '2017-05-30 22:44:59', '2017-05-30 22:44:59'),
(48, 45, 44, '2017-05-30 22:52:49', '2017-05-30 22:52:49'),
(49, 35, 45, '2017-07-03 23:56:18', '2017-07-03 23:56:18'),
(51, 49, 47, '2017-07-06 19:00:37', '2017-07-06 19:00:37'),
(52, 50, 48, '2017-07-06 19:10:06', '2017-07-06 19:10:06'),
(53, 53, 49, '2020-09-22 02:49:44', '2020-09-22 02:49:44'),
(54, 49, 50, '2020-09-22 06:15:40', '2020-09-22 06:15:40'),
(55, 49, 51, '2020-09-22 06:15:47', '2020-09-22 06:15:47'),
(56, 61, 52, '2020-09-22 22:38:09', '2020-09-22 22:38:09'),
(57, 121, 53, '2020-09-23 02:20:25', '2020-09-23 02:20:25'),
(58, 125, 54, '2020-09-23 05:29:33', '2020-09-23 05:29:33'),
(59, 145, 55, '2020-09-23 05:50:16', '2020-09-23 05:50:16'),
(60, 161, 56, '2020-09-23 06:47:12', '2020-09-23 06:47:12'),
(61, 162, 57, '2020-09-23 06:47:13', '2020-09-23 06:47:13'),
(62, 163, 58, '2020-09-23 06:47:13', '2020-09-23 06:47:13'),
(63, 164, 59, '2020-09-23 06:47:14', '2020-09-23 06:47:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problem`
--

CREATE TABLE `problem` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `creates_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problems`
--

CREATE TABLE `problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `open_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `close_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `course_id` int(10) UNSIGNED NOT NULL,
  `type_problem` varchar(60) NOT NULL,
  `teamworks` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `problems`
--

INSERT INTO `problems` (`id`, `name`, `description`, `open_at`, `close_at`, `created_at`, `updated_at`, `course_id`, `type_problem`, `teamworks`) VALUES
(1, 'Calculadora de Calorías', 'Ejercicio tiene como objetivo la construcción de una calculadora de calorías.', '2020-09-23 03:32:21', '2016-12-30 11:00:00', '2020-09-23 03:32:21', '2020-09-23 06:32:21', 1, 'Individual', 0),
(5, 'Balanceando Ecuaciones Químicas', 'Realización de un programa que automatice el proceso de balanceo de ecuaciones químicas inestables.', '2020-09-23 03:34:51', '2016-12-01 00:45:00', '2020-09-23 03:34:51', '2016-11-16 09:31:32', 2, 'Individual', 0),
(7, 'Tiro al blanco', 'Calcular la trayectoria de un proyectil blablabla', '2020-09-23 03:33:54', '2016-12-25 18:30:00', '2020-09-23 03:33:54', '2020-09-23 06:33:54', 6, 'Individual', 0),
(9, '¿Cuánto pastel comimos?', 'El objetivo de este problema es introducir al cálculo de fracciones, en particular a la suma de fracciones de igual denominador.', '2020-09-23 03:32:36', '2018-12-31 03:00:00', '2020-09-23 03:32:36', '2020-09-23 06:32:36', 1, 'Individual', 0),
(10, 'Introduccion', '1° Breve introduccion a Problock que plantea diferentes problemas de la programacion basica', '2020-09-23 03:35:36', '0000-00-00 00:00:00', '2020-09-23 03:35:36', '2017-07-04 00:36:03', 8, 'Individual', 0),
(11, 'Hola Mundo', 'Elabore su primero \"Hola mundo\"', '2020-09-23 03:35:44', '0000-00-00 00:00:00', '2020-09-23 03:35:44', '2017-05-26 00:43:32', 8, 'Individual', 0),
(12, 'Biologia', 'vamos a transmitir problemas de biología a una plataforma de programación.', '2020-09-23 03:35:56', '0000-00-00 00:00:00', '2020-09-23 03:35:56', '2017-05-30 22:42:50', 8, 'Individual', 0),
(13, 'Calculadora (Sin terminar)', 'Calculadora para todos los colegios', '2020-09-23 03:35:27', '0000-00-00 00:00:00', '2020-09-23 03:35:27', '2017-07-04 00:37:54', 8, 'Individual', 0),
(14, 'Escribo una noticia', 'Este problema permitirá a los estudiantes construir una noticia según una cierta estructura', '2020-09-23 03:32:11', '2017-09-30 03:00:00', '2020-09-23 03:32:11', '2020-09-23 06:32:11', 1, 'Individual', 0),
(62, 'Test de prueba para Actividades Grupales', 'Test de prueba para Actividades Grupales', '2020-09-23 13:00:00', '2020-12-31 13:00:00', '2020-09-24 05:28:02', '2020-09-24 05:28:02', 1, 'Grupal', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problem_activity_groups`
--

CREATE TABLE `problem_activity_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `problem_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `creates_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `teamwork_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `researchers`
--

CREATE TABLE `researchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources`
--

CREATE TABLE `resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resources`
--

INSERT INTO `resources` (`id`, `activity_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 3, '\n\n        <h4>Utilizando Condicionales</h4>\n\n        En programación, una sentencia <b>condicional</b> es una instrucción o grupo de instrucciones que se pueden ejecutar o no dependiendo de la veracidad de su condición.\n\n        Los tipos más conocidos de sentencias condicionales son el SI..ENTONCES (if..then), el SI..ENTONCES..SI NO (if..then..else)\n        <br><br>\n        <img alt=\"\" src=\"http://www.ikerg1972.com/wp-content/uploads/2015/02/Instruccion-if-else.jpg\">\n\n    ', '2016-10-25 06:25:11', '2016-10-25 06:25:11'),
(2, 7, '', '2016-10-25 07:22:40', '2016-10-25 07:22:40'),
(3, 2, '\n        <div class=\"wysiwyg-text-align-center\"><h3>¿Qué son las Variables?</h3></div>\n        Una variable consiste en un elemento al cual le damos un nombre y le atribuimos un determinado tipo de información.<br><br>\n        Las variables pueden ser consideradas \"cajas\" que nos permiten guardar información temporalmente para luego ser utilizada.\n                <div class=\"wysiwyg-text-align-center\"><img alt=\"\" src=\"http://img.c4learn.com/2012/02/Variable-in-Java.jpg\"></div>\n        <br>\n        De este modo podríamos escribir que:\n        <br>\n        variable <b>a</b> = \"perro\"<br>\n        variable <b>b</b> = \"muerde\"<br>\n        <br>\n        La variable que nosotros llamamos \"a\" posee un elemento de información de tipo texto que es \"perro\".\n        Asimismo, la variable \"b\" contiene el valor \"muerde\".\n        Podríamos definir una tercera variable que fuese la suma de estas dos:\n        <br>\n        variable <b>c</b> = <b>a</b> + <b>b</b>\n        <br><br>\n        Si introdujésemos una petición de impresión de esta variable en nuestro lenguaje ficticio:\n        <br><br>\n        imprimir(c)\n        <br>\n        El resultado podría ser:\n        <br>\n        <pre><code>&gt;&gt; perro muerde</code></pre>\n        <br>\n        Podríamos de la misma forma trabajar con variables que contuviesen números y construir nuestro programa:\n\n        <b>a</b> = 3<br>\n        <b></b><pre><code><b> b </b>= 4<br><b> c</b> = <b>a</b> + <b>b</b><br> imprimir(<b>c</b>)</code></pre><br>\n        <br>\n        El resultado de nuestro programa sería:\n        <br>\n        &gt;&gt; <b>7</b>\n    ', '2016-10-25 07:22:45', '2016-11-29 03:48:00'),
(4, 4, '\n        <h4>¿Como repetimos sentencias?</h4>\n        Un bucle o ciclo, en programación, es una sentencia que se realiza repetidas veces a un trozo aislado de código, hasta que la condición asignada a dicho bucle deje de cumplirse.\n        <br><br>\n        Generalmente, un bucle es utilizado para hacer una acción repetida sin tener que escribir varias veces el mismo código, lo que ahorra tiempo, procesos y deja el código más claro y facilita su modificación en el futuro.\n        <br><br>\n\n        Los dos bucles más utilizados en programación son el bucle <b>while</b> y el ciclo <b>for</b>\n\n        <br><br>\n        <img alt=\"\" src=\"http://3.bp.blogspot.com/-seVXw8tWh9c/Ubc7bLoRlNI/AAAAAAAAAGQ/2MI7omSS0kY/s1600/pic024.gif\">\n    ', '2016-10-25 07:22:48', '2016-10-25 07:22:48'),
(5, 11, '', '2016-10-25 07:22:50', '2016-10-25 07:22:50'),
(6, 6, '\n        <h4>R M B</h4>\n        El\n        <b>ritmo metabólico basal</b> o metabolismo basal es el valor mínimo de energía necesaria para que la célula subsista.\n        <br><br>Esta energía mínima es utilizada por la célula en las reacciones químicas intracelulares necesarias para la realización de funciones metabólicas esenciales, como es el caso de la respiración.\n        <br><br>\n        En el organismo, el metabolismo basal depende de varios factores, como sexo, talla, peso, edad, etc. Como claro ejemplo del metabolismo basal está el caso del coma. La persona «en coma», está inactiva, pero tiene un gasto mínimo de calorías, razón por la que hay que seguir alimentando al organismo.\n    <br><br>\nEn la actualidad, se utilizan las siguientes fórmulas para calcular el RMB o Tása Metabólica Basal (<b>TMC</b>):\n<br>\n<img alt=\"\">\n<br><br>\nPara mas información visita: <a rel=\"nofollow\" href=\"https://es.wikipedia.org/wiki/Ecuaci%C3%B3n_de_Harris-Benedict\">Ecuación de Harris-Benedict</a>', '2016-10-25 07:22:52', '2017-04-10 17:41:21'),
(7, 5, '', '2016-10-25 07:22:56', '2016-10-25 07:22:56'),
(8, 10, '', '2016-10-25 07:23:00', '2016-10-25 07:23:00'),
(9, 1, '<div class=\"wysiwyg-text-align-center\"><h2><span class=\"wysiwyg-color-blue\">Imprimiendo</span> <span class=\"wysiwyg-color-red\">en</span> <span class=\"wysiwyg-color-green\">consola</span></h2></div><h3><span class=\"wysiwyg-color-black\">Pasos a seguir</span></h3><ul><li>Utilizar bloque \"imprimir en consola\".</li><li>Asignarle un texto o número</li><li>Ejecutar aplicación</li></ul><div class=\"wysiwyg-text-align-center\"><img alt=\"\"></div><br>&nbsp; Para mas información ingresar a: <a rel=\"nofollow\" href=\"https://es.wikipedia.org/wiki/Interfaz_de_l%C3%ADnea_de_comandos\">¿Que es la consola?</a><br><br>', '2016-10-25 07:23:02', '2016-12-06 04:35:38'),
(10, 8, '', '2016-10-25 08:06:27', '2016-10-25 08:06:27'),
(11, 9, '', '2016-10-25 08:06:29', '2016-10-25 08:06:29'),
(12, 12, '<h3><b>Esta es la <span class=\"wysiwyg-color-blue\">descripción</span> de la <span class=\"wysiwyg-color-green\">Primera Actividad</span></b></h3>', '2016-11-11 09:24:39', '2016-11-11 09:24:39'),
(13, 14, '', '2016-12-19 03:14:38', '2016-12-19 03:14:38'),
(14, 15, '', '2016-12-19 03:58:19', '2016-12-19 03:58:19'),
(15, 16, '', '2016-12-28 22:14:53', '2016-12-28 22:14:53'),
(16, 17, 'Esta actividad permite que muestres tu poesìa que escribiste.<br>haz un programa que le te pida un verso y lo mostrarà en pantalla.', '2017-04-10 17:54:19', '2017-04-10 17:54:19'),
(17, 18, '', '2017-04-10 17:54:28', '2017-04-10 17:54:28'),
(18, 20, 'ew', '2017-04-10 17:54:36', '2017-04-10 17:54:47'),
(19, 21, '', '2017-04-10 17:55:05', '2017-04-10 17:55:05'),
(20, 22, 'Estás haciendo una invitación a comer a tu casa y has pensado que quieres que coman pastel. Primero debes invitar a tus comensales, de forma interactiva. Para ello propones que el computador les pregunte el nombre y luego le das la bienvenida. ¿Te parece?<br>', '2017-04-25 17:48:48', '2017-04-25 19:38:29'),
(21, 23, 'Si bien dividiste tu pastel en los pedazos justos, recuerda que tú y tus amigos cambian de opinión, y probablemente ha sobrado pastel. Además, ahora ya han comido todos... recordaste que te faltó invitar al vecino!!! Para saber cuántos pedazos quedan, necesitas hacer un cálculo rápido.<br><br>Te desafiamos a calcular la fracción de pastel que se han comido entre todos, y decirle a tu vecino&nbsp; si queda pastel o no. <br>Recuerda que todos los pedazos son iguales.<br><br>\nPista --&gt;¿Cuál será el denominador?\n\n<br>', '2017-04-25 17:50:01', '2017-04-25 20:00:58'),
(22, 25, 'Luego de hacer tu invitación, 3 de tus amigos te respondieron que asistirán. El primero que respondió dijo que comerá 3 trozos de pastel, el segundo te dijo que comerá 2, y tu tercer amigo te dijo que comerá sólo uno. Sacas rápidamente las cuentas (y sabiendo que te comerás 2), sabes que deberás dividir el pastel en 8 trozos (iguales, para ser justos).<br><br>No obstante, tus amigos cambian de opinión, por lo que sabes que debes repetir este cálculo varias veces...<br><br>¿Cuántos trozos comerán entre todos? Haz una calculadora que te permita sacar las cuentas del total que comerán entre tú y tus amigos&nbsp; =)<br>', '2017-04-25 17:53:43', '2017-04-25 19:54:16'),
(23, 26, 'Todo lo que hiciste funciona sólo si todos los pedazos son iguales. ¿Cómo lo harías los pedazos no son iguales? Haz un programa que te permita calcular cuánto comieron tú y tus amigos, sabiendo qué fracción del pastel comió cada uno.<br><br>', '2017-04-25 17:54:58', '2017-04-25 20:12:20'),
(24, 35, 'En la siguiente actividad se explicara y realizara su primer programa en ProBlock<br>', '2017-05-25 01:28:31', '2017-05-25 01:35:57'),
(25, 33, 'Siga las siguientes instrucciones.<br>Cree una variable y el resultado de la suma de 16 con 4&nbsp; guardela dentro de está.<br>Luego esa variable dividala por 5, para despues multiplicarla por 2.5&nbsp; y mostrar ese resultado en pantalla.<br>', '2017-05-25 01:42:48', '2017-05-25 20:13:56'),
(26, 36, 'Ahora escriba una historia y guardelo dentro de una variable, hecho eso hago los mismo 3 veces para aumentar la historia, contemple su resultado.<br>Todo esto por consola.<br>', '2017-05-25 20:19:35', '2017-05-25 20:35:31'),
(27, 44, 'Calculadora para los colegios... Baka One-chan<br>', '2017-05-30 23:41:00', '2017-05-30 23:41:00'),
(28, 44, 'Calculadora para los colegios... Baka One-chan<br>', '2017-05-30 23:41:00', '2017-05-30 23:41:00'),
(29, 44, 'Calculadora para los colegios... Baka One-chan<br>', '2017-05-30 23:41:00', '2017-05-30 23:41:00'),
(30, 39, 'proceso biológico que hace el corazón, lograr que imprima en pantalla \"el corazón esta latiendo\", si esque este es Verdadero.<br>', '2017-06-04 19:30:41', '2017-06-05 17:58:18'),
(31, 45, 'Ahora vamos a generar un objeto con altura y ancho del objeto.<br>Además que este se muestre en consola con todos los datos ingresados.<br>Tambien el programa debe ser capaza de diferenciar si es un cuadradro o un rectangulo, esto pensado en que sea más facil el programa.<br><br><br>', '2017-07-04 00:09:11', '2017-07-04 00:42:11'),
(32, 47, 'Haz un programa que te permita pedir un problema social, para luego pedir el nombre de quien lo escribió. como resultado debe mostrar el nombre, seguido de \"propone \" para luego terminar mostrando el problema social.', '2017-07-06 19:07:10', '2017-07-06 19:07:10'),
(33, 48, '[[ INTRODUCCION ]]<br><br>Haz un programa que permita a tus compañeros planificar una noticia', '2017-07-06 19:11:34', '2017-07-06 19:11:34'),
(34, 50, '', '2020-09-22 06:15:43', '2020-09-22 06:15:43'),
(35, 51, '', '2020-09-22 06:15:48', '2020-09-22 06:15:48'),
(36, 54, '', '2020-09-23 05:29:39', '2020-09-23 05:29:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scores`
--

CREATE TABLE `scores` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `answere_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `score` int(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `scores`
--

INSERT INTO `scores` (`id`, `student_id`, `answere_id`, `activity_id`, `score`, `created_at`, `updated_at`) VALUES
(8, 2, 13, 1, 100, '2016-11-11 02:48:51', '2016-10-20 06:58:19'),
(9, 2, 14, 2, 100, '2016-11-11 02:48:55', '2016-10-20 06:58:35'),
(10, 2, 15, 3, 0, '2016-11-11 02:49:00', '2016-10-20 07:00:02'),
(11, 2, 16, 7, 100, '2016-11-11 02:49:05', '2016-10-20 07:28:53'),
(12, 2, 17, 9, 100, '2016-11-11 02:49:09', '2016-10-20 07:35:01'),
(13, 2, 18, 10, 60, '2016-11-11 02:48:32', '2016-10-20 07:35:23'),
(14, 2, 19, 11, 100, '2016-11-11 02:48:26', '2016-10-20 07:35:33'),
(15, 1, 10, 9, 0, '2016-12-19 01:35:16', '2016-12-19 04:35:16'),
(16, 1, 6, 1, 100, '2016-11-11 02:48:15', '2016-10-25 09:16:59'),
(17, 1, 2, 2, 100, '2016-11-11 02:48:05', '2016-10-25 09:17:38'),
(18, 1, 7, 3, 77, '2016-11-29 02:19:41', '2016-11-29 05:19:41'),
(19, 1, 1, 4, 100, '2016-11-29 01:53:58', '2016-11-29 04:53:58'),
(20, 1, 20, 5, 100, '2016-11-11 02:47:36', '2016-10-25 09:23:33'),
(21, 3, 21, 1, 100, '2016-11-11 09:26:58', '2016-11-11 09:26:58'),
(22, 1, 22, 6, 100, '2016-11-29 02:21:20', '2016-11-29 05:21:20'),
(23, 1, 8, 7, 0, '2016-11-29 05:21:30', '2016-11-29 05:21:30'),
(24, 5, 23, 1, 100, '2016-12-18 18:19:03', '2016-12-18 21:19:03'),
(25, 5, 24, 14, 0, '2016-12-19 01:26:02', '2016-12-19 04:26:02'),
(26, 5, 25, 15, 0, '2016-12-19 01:30:32', '2016-12-19 04:30:32'),
(27, 1, 26, 14, 0, '2016-12-19 05:47:03', '2016-12-19 08:47:03'),
(28, 8, 27, 22, 100, '2017-04-25 20:19:23', '2017-04-25 20:19:23'),
(29, 17, 28, 22, 100, '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(30, 17, 29, 22, 0, '2017-04-26 23:49:39', '2017-04-26 23:49:39'),
(31, 27, 30, 22, 100, '2017-04-26 23:50:47', '2017-04-26 23:50:47'),
(32, 11, 31, 22, 100, '2017-04-26 23:50:58', '2017-04-26 23:50:58'),
(33, 19, 32, 22, 100, '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(34, 28, 33, 22, 100, '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(35, 18, 34, 22, 100, '2017-04-26 23:50:50', '2017-04-26 23:50:50'),
(36, 22, 35, 22, 100, '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(37, 16, 36, 22, 100, '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(38, 26, 37, 22, 100, '2017-04-26 23:50:37', '2017-04-26 23:50:37'),
(39, 20, 38, 22, 100, '2017-04-26 23:50:45', '2017-04-26 23:50:45'),
(40, 10, 39, 22, 100, '2017-04-26 23:50:48', '2017-04-26 23:50:48'),
(41, 15, 40, 22, 100, '2017-04-26 23:50:50', '2017-04-26 23:50:50'),
(42, 21, 41, 22, 100, '2017-04-26 23:50:58', '2017-04-26 23:50:58'),
(43, 25, 42, 22, 100, '2017-04-26 23:51:05', '2017-04-26 23:51:05'),
(44, 16, 43, 25, 100, '2017-04-27 00:13:37', '2017-04-27 00:13:37'),
(45, 10, 44, 25, 100, '2017-04-27 00:10:09', '2017-04-27 00:10:09'),
(46, 27, 45, 25, 100, '2017-04-27 00:15:33', '2017-04-27 00:15:33'),
(47, 26, 46, 25, 100, '2017-04-27 00:16:07', '2017-04-27 00:16:07'),
(48, 22, 47, 25, 100, '2017-04-27 00:14:36', '2017-04-27 00:14:36'),
(49, 28, 48, 25, 100, '2017-04-27 00:14:19', '2017-04-27 00:14:19'),
(50, 17, 49, 25, 100, '2017-04-27 00:13:24', '2017-04-27 00:13:24'),
(51, 25, 50, 25, 100, '2017-04-27 00:13:08', '2017-04-27 00:13:08'),
(52, 20, 51, 25, 100, '2017-04-27 00:14:24', '2017-04-27 00:14:24'),
(53, 19, 52, 25, 100, '2017-04-27 00:14:37', '2017-04-27 00:14:37'),
(54, 11, 53, 25, 100, '2017-04-27 00:14:31', '2017-04-27 00:14:31'),
(55, 15, 54, 25, 100, '2017-04-27 00:14:46', '2017-04-27 00:14:46'),
(56, 18, 55, 25, 100, '2017-04-27 00:16:50', '2017-04-27 00:16:50'),
(57, 21, 56, 25, 100, '2017-04-27 00:16:35', '2017-04-27 00:16:35'),
(58, 33, 57, 22, 100, '2017-07-06 18:00:43', '2017-07-06 18:00:43'),
(59, 33, 58, 25, 100, '2017-07-06 18:13:35', '2017-07-06 18:13:35'),
(60, 33, 59, 23, 100, '2017-07-06 18:22:26', '2017-07-06 18:22:26'),
(61, 33, 60, 26, 0, '2017-07-06 19:17:36', '2017-07-06 19:17:36'),
(62, 33, 61, 47, 100, '2017-07-06 19:22:47', '2017-07-06 19:22:47'),
(63, 35, 62, 22, 100, '2018-07-10 19:12:54', '2018-07-10 19:12:54'),
(64, 34, 63, 22, 100, '2018-07-10 19:18:43', '2018-07-10 19:18:43'),
(65, 34, 64, 25, 100, '2018-07-10 19:34:40', '2018-07-10 19:34:40'),
(66, 35, 65, 25, 100, '2018-07-10 19:41:10', '2018-07-10 19:41:10'),
(67, 34, 66, 23, 100, '2018-07-10 20:00:15', '2018-07-10 20:00:15'),
(68, 35, 67, 23, 100, '2018-07-10 20:03:41', '2018-07-10 20:03:41'),
(70, 50, 69, 22, 100, '2018-12-20 18:05:22', '2018-12-20 18:05:22'),
(71, 42, 70, 22, 100, '2018-12-20 18:05:17', '2018-12-20 18:05:17'),
(72, 39, 71, 22, 100, '2018-12-20 18:05:16', '2018-12-20 18:05:16'),
(73, 47, 72, 22, 100, '2018-12-20 18:05:18', '2018-12-20 18:05:18'),
(74, 45, 73, 22, 100, '2018-12-20 18:05:16', '2018-12-20 18:05:16'),
(75, 43, 74, 22, 100, '2018-12-20 18:05:23', '2018-12-20 18:05:23'),
(76, 44, 75, 22, 100, '2018-12-20 18:05:25', '2018-12-20 18:05:25'),
(77, 48, 76, 22, 100, '2018-12-20 18:06:03', '2018-12-20 18:06:03'),
(78, 40, 77, 22, 100, '2018-12-20 18:05:51', '2018-12-20 18:05:51'),
(79, 49, 78, 22, 100, '2018-12-20 18:06:10', '2018-12-20 18:06:10'),
(80, 46, 79, 22, 100, '2018-12-20 18:06:08', '2018-12-20 18:06:08'),
(81, 48, 80, 25, 100, '2018-12-20 18:45:47', '2018-12-20 18:45:47'),
(82, 50, 81, 25, 100, '2018-12-20 18:45:44', '2018-12-20 18:45:44'),
(83, 39, 82, 25, 100, '2018-12-20 18:45:50', '2018-12-20 18:45:50'),
(84, 47, 83, 25, 100, '2018-12-20 18:45:49', '2018-12-20 18:45:49'),
(86, 46, 85, 25, 100, '2018-12-20 18:47:38', '2018-12-20 18:47:38'),
(87, 50, 86, 23, 0, '2018-12-20 18:48:33', '2018-12-20 18:48:33'),
(88, 40, 87, 25, 100, '2018-12-20 18:49:09', '2018-12-20 18:49:09'),
(90, 43, 89, 25, 100, '2018-12-20 18:52:14', '2018-12-20 18:52:14'),
(91, 45, 90, 25, 100, '2018-12-20 18:55:10', '2018-12-20 18:55:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `user_id`) VALUES
(1, 4),
(2, 9),
(3, 10),
(4, 11),
(5, 16),
(6, 17),
(7, 18),
(8, 19),
(9, 20),
(10, 21),
(11, 22),
(12, 23),
(13, 24),
(14, 25),
(15, 26),
(16, 27),
(17, 28),
(18, 29),
(19, 30),
(20, 31),
(21, 32),
(22, 33),
(23, 34),
(24, 35),
(25, 36),
(26, 37),
(27, 38),
(28, 39),
(29, 40),
(30, 43),
(31, 44),
(32, 47),
(33, 48),
(34, 50),
(35, 51),
(36, 52),
(37, 53),
(38, 58),
(39, 59),
(40, 60),
(41, 61),
(42, 62),
(43, 63),
(44, 64),
(45, 65),
(46, 66),
(47, 67),
(48, 68),
(49, 69),
(50, 70),
(51, 71),
(52, 72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teamwork`
--

CREATE TABLE `teamwork` (
  `id` int(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `students` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `teamwork`
--

INSERT INTO `teamwork` (`id`, `name`, `students`) VALUES
(0, 'Individual', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teamwork_inscription`
--

CREATE TABLE `teamwork_inscription` (
  `id` int(10) NOT NULL,
  `problems_id` int(10) UNSIGNED NOT NULL,
  `teamwork_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mlastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('student','teacher','researcher','admin') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `flastname`, `mlastname`, `gender`, `type`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'javebers@gmail.com', '$2y$10$oO.gyez9CPTM9HqcUUoqQ.1pvIJQC2D5bsXNm/Pf33Y9XnJECizni', 'Javier', 'Ebers', 'Mascaró', 'male', 'student', NULL, 'XMKdULN4XUyGHDkHFE2ou0AZxP45IiwYLp4rhMLINgstZHTxO58lDceTVf7E', '2016-03-28 04:39:40', '2016-05-25 04:24:25'),
(3, 'fer@hotmail.com', '$2y$10$gC12FH/YfTB4HBLba35LR.ePAAYyzfTkIzS2B79eHGFYx2yAGyomi', 'Fernando', 'Acevedo', 'Mandiola', 'male', 'researcher', NULL, 'IiSWaF6qOtaJXaAP8psMvXQVcfd2ErOPWRbIjfgNQUVfUCXePvHjYL9ICkI0', '2016-03-28 20:07:03', '2016-03-28 20:07:17'),
(4, 'alumno@unab.cl', '$2y$10$jZ6p9g5pg4EtkNvIt05RD.nh8iykt.iVdS1rzCscm5oehW4VcUb36', 'Alumno', 'Prueba', 'Uno', 'male', 'student', NULL, 'EbkVwRdYk4CRlOVXp4gbeycg5AgLmZuGCcCArsJlhmBFUX2BfgresSo5Y76p', '2016-05-25 04:25:01', '2020-09-23 20:55:59'),
(5, 'profesor@unab.cl', '$2y$10$0gw9zbVUKbA8jTxEBEgUK.l2bKqEhBmaw9rRBJB9MolfqNSD7xHhi', 'Profesor', 'Prueba', 'UNAB', 'male', 'teacher', NULL, 'YFJYoB71PrBSVFRBSBeG76QrPFvUcxdiaf8FgCoAVNs7WScmAdUrHWtUMU2U', '2016-10-11 03:34:45', '2020-09-23 20:17:09'),
(9, 'alumno2@unab.cl', '$2y$10$499i6Ah0buQQ7.JYhnghuuASrnoOnBemsh3g.uoz2NFr3yapgUEXe', 'Alumno', 'Prueba', 'Dos', 'male', 'student', NULL, NULL, '2016-10-20 06:06:43', '2016-10-20 06:06:43'),
(10, 'alumno3@unab.cl', '$2y$10$1mWCfqQ.4D11WHrKzBoHKOENxhMrU34eKH41A7lRGSMzh4kf.b6l2', 'Alumno', 'Prueba', 'Tres', 'male', 'student', NULL, '2QlwMfdcMU4M9yT16fPQM4X54Quz1NbQzBZ6QXT2SkeiAJyixDmlTqm8mW5Y', '2016-11-11 09:26:47', '2016-12-15 06:34:18'),
(11, 'admin@unab.cl', '$2y$10$VJPUYnCFaZRxNYpdJNU6IuNq5LHpCYQr.Ss7yatJoUKUCTbAV4nWO', 'Primer', 'Administrador', 'Prueba', 'male', 'admin', NULL, 'dXA37LEXWhLNwdF0SAbyGwDpxfCPureJNhU4Yeus6iCgbCJNvDZAMLAePSeW', '2016-12-06 06:03:50', '2020-09-03 18:17:06'),
(14, 'mespinoza@unab.cl', '$2y$10$JBAdYRgAWc/afCZmZ117KuSEXYtd.1JrKhtSVYOhjEFZwV.Dp.HJm', 'Marcelo', 'Espinoza', 'Torrealba', 'male', 'teacher', NULL, 'TKjLOKVpPj1OyPyoNML9m29OkK6wRQFV4NupJboQlc4asES14ckTLpRpncH8', '2016-12-06 09:51:52', '2016-12-06 09:52:54'),
(15, 'profesor2@unab.cl', '$2y$10$Pa.vjXD8g61uJPHb6fV6teEakPNoJ1/SyR/PbK.ZfLR7KaI3R7N8G', 'Profesor', 'Pueba', 'Dos', 'male', 'teacher', NULL, NULL, '2016-12-06 09:54:02', '2016-12-06 09:54:02'),
(16, 'fer.godoy@gmail.com', '$2y$10$utJWVnL5D.Z2cQjk0nYAyeZibSlZ0kCYN6FXZUAwSi2wUCieiV5pe', 'Fernando', 'Godoy', 'Garcia', 'male', 'student', NULL, 'ViSSR6xd6BQArcRzcFSNdi6YtEH3zhHjNgqDMLNRazESPuf9qcSGId7D5iOf', '2016-12-18 20:11:54', '2016-12-19 04:33:20'),
(17, 'o.acevedoosses@uandresbello.edu', '$2y$10$VTLnDd18V7CQtCQd1k2DDuCePWgb/vdsqThqm/QQ9/f42w20OJUdG', 'Oscar', 'Acevedo', 'Osses', 'male', 'student', NULL, 'ZYLVs9vzzIWO23smaLPKqRQwbm4oOldPLU94oxWK2P6m5o5xPbJdWHel7nZY', '2017-02-27 23:27:13', '2017-03-01 22:10:47'),
(18, 'carolitamesa@gmail.com', '$2y$10$DbYk8B8dZlX1bhg7zkSGE.KgPtpI07HepyEWwt4/QHTkP59waBT2O', 'carolina', 'mesa', 'matus', 'male', 'student', NULL, 'BVk4XNMv938NuwSd0dfDqgLz3uD2bovQ3GaPfMV2j0XfgM3VMHuHZzR5l0jx', '2017-04-06 01:49:03', '2017-04-06 01:50:27'),
(19, 'profesor.colegio@unab.cl', '$2y$10$oFSXlbcqxmk6XjDhxnulNuM2vOqhguvGupei3AS7u.7m5wH6qPeUu', 'profesor', 'colegio', 'colegio', 'male', 'student', NULL, 'leQo4lyaNpKhcyCAwba3jHAUTLTK5hC94nmQ2HPGZsrrtY8cM7u9tXHLBW4E', '2017-04-25 17:35:24', '2017-04-25 20:21:06'),
(20, 'profesor01_ecr@unab.cl', '$2y$10$6TJ56SoiaZbd8z0po1FHz.seLtyl8/F628.fAVShNEpyP43hxWuGK', 'Profesor01', 'Colegio', 'ECR', 'male', 'student', NULL, 'SisSz3WZmkcNM0d6BUplvDaZAjhPyYi8cjQZDZBKTd5L0gjObMIVxyXAdvkm', '2017-04-26 18:31:58', '2017-04-26 18:32:05'),
(21, 'profesor02_ecr@unab.cl', '$2y$10$ZKCvDdZW2L2GwHLegWdKAOmBmPvitKgKNbAr2Y1FtxmDrrq1WMnxy', 'Profesor02', 'Colegio', 'ECR', 'male', 'student', NULL, 'spYSLXQnYjXq5gnnlOipvgvBAzPEEBHptpvfTyrHkhGLWDzt1k0bB4Uli5ja', '2017-04-26 18:33:05', '2017-04-26 18:33:11'),
(22, 'profesor03_ecr@unab.cl', '$2y$10$9tr7nDUbm1TM3HTteti4P.IXKRfaVRy4Ywgyj10O6m6IC3kHmiZSC', 'Profesor03', 'Colegio', 'ECR', 'male', 'student', NULL, 'O2Z6MCDwfAqBUsPnV22DaOsdCcoEZfaQYFRFlNsYyyvvnmAicxdhgg2XHmvi', '2017-04-26 18:33:42', '2017-04-26 18:33:46'),
(23, 'profesor04_ecr@unab.cl', '$2y$10$0.XJaTbnzY4mw4yVH7BopueUCeMgFQEvQISN7FvKKN1PM3rLcecIW', 'Profesor04', 'Colegio', 'ECR', 'male', 'student', NULL, 'jjYTxT7ccYsDgk6Hb5qu0V2jiLMvnH0DLavpp0OZHe43Mf4QL4VP8UYDWjks', '2017-04-26 18:34:23', '2017-04-26 23:44:20'),
(24, 'profesor05_ecr@unab.cl', '$2y$10$I054APIfIVy.nI1siDQ3deH0tVUbtj7Pu/zxFsMN0zknJgGDJ0pvK', 'Profesor05', 'Colegio', 'ECR', 'male', 'student', NULL, 'NB4NUlY0mkrigQ1UPRfdI2Obm2ytC2MtVz8s4d0TWkYXwbmOzZMxfhdYLfn7', '2017-04-26 18:34:57', '2017-04-26 18:35:02'),
(25, 'profesor06_ecr@unab.cl', '$2y$10$hsZ1cqi9./9H3ilNpyuuCOSorHb1Dy1bkiZXsUA9xPRNZFvArxd8O', 'Profesor06', 'Colegio', 'ECR', 'male', 'student', NULL, 'gxYUw0Szqzwu4jgYDFSCPOc8s3QQjJGkvNrZ2vJ0KuMSuKzl83vm4HrDlRiC', '2017-04-26 18:35:32', '2017-04-26 18:35:36'),
(26, 'profesor07_ecr@unab.cl', '$2y$10$n1tZMPJbpaSq5snFiWceuO6.rsZ8XcZDFvgi8kgVMKRtbiPlHty1q', 'Profesor07', 'Colegio', 'ECR', 'male', 'student', NULL, 'IXg8ojyIGD2cPBLEwQYrIFFRSQPiju3SQwOeQvf9h8w0CfDynGBPXyCFpSbZ', '2017-04-26 18:36:05', '2017-04-26 18:36:50'),
(27, 'profesor08_ecr@unab.cl', '$2y$10$6Aa02K4I08Y6PTGDS3urWu6Q5GfhStewW3oTUAD7hnFzVt2iIyp9q', 'Profesor08', 'Colegio', 'ECR', 'male', 'student', NULL, 'NzcRf9z2H9cgS0lav1i14S44Ps6ljzeDO2YhIzsIWIte365v72ev3SNcGWCK', '2017-04-26 18:37:23', '2017-04-27 00:20:48'),
(28, 'profesor09_ecr@unab.cl', '$2y$10$9f1h7cwxYQIx9KLXkzAdOOoz2o/k6/fWgFS.ybNCPKVp7R.9P6tam', 'Profesor09', 'Colegio', 'ECR', 'male', 'student', NULL, 'ZW4qDMWNCGAqbWjR2TLGbhzSOP037SFhfqMRPYdJPHszP4aNJcNCnmEYPJB4', '2017-04-26 18:38:08', '2017-04-26 18:38:13'),
(29, 'profesor10_ecr@unab.cl', '$2y$10$sp5ctsVo3/wHkYLbqX50fOk6caexPKPVsn0I3c08tXuyVDQ9/yplq', 'Profesor10', 'Colegio', 'ECR', 'male', 'student', NULL, 'YSHXgD07HP4gaWLeXsJbm6ihPwLsjxsylUh1cDKs7xkzQdV4BbMkCQhf6K2i', '2017-04-26 18:39:15', '2017-04-26 18:39:32'),
(30, 'profesor11_ecr@unab.cl', '$2y$10$Q7NULFUsa8j1dyksYdIFo.cgF0v./ZEzc/xmEjAQv9uzS.wV/ZKJi', 'Profesor11', 'Colegio', 'ECR', 'male', 'student', NULL, 'Y4ZX1zwXNg3RtrBlBStn4KrtRyLO6xNxjlY8gLDUI90w1s0KMg2qvuo6mvuQ', '2017-04-26 18:40:20', '2017-04-26 18:40:53'),
(31, 'profesor12_ecr@unab.cl', '$2y$10$i9hQkg0CqI8QNUfwHdDYDOEYIVd89ZzZS3mK8ofQq08vm5JbTCa72', 'Profesor12', 'Colegio', 'ECR', 'male', 'student', NULL, '79XBhqQ3orYCimUbwnxsuLTTX78Tbj76LnZxIcsHlqribBS7eu67vKAymR8g', '2017-04-26 18:41:30', '2017-04-26 18:41:35'),
(32, 'profesor13_ecr@unab.cl', '$2y$10$93xcDA.8qG4Dsc5LKnUMS.d9rQqNzBevkFnZwp/rU60332Caz345e', 'Profesor13', 'Colegio', 'ECR', 'male', 'student', NULL, 'MR9mLlExzcWExPUveEfz5wHCYTQBxyMhCQYHunxG7C95kbgVmInDdOkbjh2b', '2017-04-26 18:42:16', '2017-04-26 18:42:22'),
(33, 'profesor14_ecr@unab.cl', '$2y$10$hROzuSwOGXfKjekXbMTvaumxQStm2D4oM3SAfWfX.Lr82U7mEUi3q', 'Profesor14', 'Colegio', 'ECR', 'male', 'student', NULL, 'ixEa4at0rlEsEg573KlhQ7wwVMy8ckihFWr7iN6ljHonuSaSjojKl62PfVgu', '2017-04-26 18:42:59', '2017-04-26 18:43:05'),
(34, 'profesor15_ecr@unab.cl', '$2y$10$BVNL6a1le56ixnVaVdD6uuGZfQDWUfQMYKhmGleWY2fnuHFHSt1YW', 'Profesor15', 'Colegio', 'ECR', 'male', 'student', NULL, 'YjrxtQgpPPir6WFxjmGqwRTn5BfW6ZdjkuW7G4tvgMSLoW4lu2MCJV6RMMeS', '2017-04-26 18:44:03', '2017-04-26 18:44:18'),
(35, 'profesor16_ecr@unab.cl', '$2y$10$6YyKvl4K4cxIkJ7ebvG7uuXC6sU/WYTWQC/9JWxqsX/8Uic0wvgO2', 'Profesor16', 'Colegio', 'ECR', 'male', 'student', NULL, 'JAKMnc7GfKnbc7WIiKMKtXMM2v0kuVObW43q7RW64ySpSCfq74O9WWiYeZsI', '2017-04-26 18:44:48', '2017-04-26 18:44:54'),
(36, 'profesor17_ecr@unab.cl', '$2y$10$VPr2F2UfVDdIU9pXgzlOWu4mB2a.H295if1N0TAjtvTx6aqKbd0ki', 'Profesor17', 'Colegio', 'ECR', 'male', 'student', NULL, 'Bw5dUfxouYBKXQTJlZBIFVjbBsA8KYsWn0BGa4pMfEibu3kboaWw0q7d0ZqJ', '2017-04-26 18:45:26', '2017-04-26 18:45:30'),
(37, 'profesor18_ecr@unab.cl', '$2y$10$6LWX20YNi2G5F8fE6G6bbOYh1auQ41kN37/PheW8K8jNPOAQDoFka', 'Profesor18', 'Colegio', 'ECR', 'male', 'student', NULL, 'drTUUqvc298EQINrUXoX3W0AxdjWPghUbtRllDyNamTs5t7bu5VMWBKHoC5q', '2017-04-26 18:45:56', '2017-04-26 18:46:16'),
(38, 'profesor19_ecr@unab.cl', '$2y$10$7GopCNpntSfZbnHrDCxyPOMfmuSM8RfDJg0mT5nwcDr9/LvLrf1uW', 'Profesor19', 'Colegio', 'ECR', 'male', 'student', NULL, 'FqmJmxYAV3tNsgjYRUTIT1gfg1QO9TDTne5ioQAvcejFjlCRhc8QPdnZzXKY', '2017-04-26 18:47:01', '2017-04-26 18:47:06'),
(39, 'profesor20_ecr@unab.cl', '$2y$10$hUzuj1wY45la/BeEtMmPiO5IpsoyXHrFPX9zOJFk2gJNtsABAKVRa', 'Profesor20', 'Colegio', 'ECR', 'male', 'student', NULL, 'jgcIAdAvTPCEN57W3LVS7KX9LxHGcxL0nrOfKSnohrvnp2mBVlqQqiDrs1pt', '2017-04-26 18:47:50', '2017-05-02 17:13:41'),
(40, 'frankcarrasco@live.cl', '$2y$10$KkRhcfk7z71TlBhjExLLZeF4JNJ3/t/uFn51k0bDYe5hGuuXvZiym', 'Francisco', 'Carrasco', 'Zepeda', 'male', 'student', NULL, NULL, '2017-05-24 23:31:32', '2017-05-24 23:31:32'),
(41, 'francisco@unab.cl', '$2y$10$qQPBoqpL1CnBcwTe6qwJ9.q0soHcd6WCR4oWsapjoeJwcRiTuxg06', 'Francisco', 'Carrasco', 'TIR', 'male', 'teacher', NULL, 'CLUojGT1QgY8sb8Z5zXgnIYGCQmm53woF9XctXgQMwGNedAE0MTOKW7BvKhi', '2017-05-25 01:09:38', '2017-07-04 00:34:12'),
(42, 'vincent@unab.cl', '$2y$10$Twr1Y.cbyseOwLk8HTAy/.5aVgZlnIm8C06R.49gHoXk4QBe6wTdC', 'Vincent', 'Depassier', 'TIR', 'male', 'teacher', NULL, '92lTo8XMgPFxqvv3xE65J7tIgVxocDAvj7MkshBEUGnu9rSHXSnKN47RVOsL', '2017-05-25 01:10:05', '2017-05-26 00:56:27'),
(43, 'mario.aguila_70@hotmail.com', '$2y$10$G9739lV7yVpWVngC5LcNjulgXrYuPs4hh.fMRKpZ7mxeJtsldLdCS', 'Mario', 'Aguila', 'Nuñez', 'male', 'student', NULL, 'SiarAdilVeCelMml6dSEO1iq71ZDvkBFP4zf24Msqt87ktHI4CMVehj2cvMr', '2017-05-26 00:38:04', '2017-05-28 13:38:23'),
(44, 'bryan.faundez.a@gmail.com', '$2y$10$jBbd30QEKkdhkSWX2IyJo.PsitIbh1aXkw9jtRr7Mxutpj.yeTQu6', 'bryan1', 'faundez', 'aguilera', 'male', 'student', NULL, NULL, '2017-05-26 00:40:40', '2017-05-26 00:40:40'),
(45, 'mario@unab.cl', '$2y$10$YMtrxIVhMNczJJi4K9RQs.NwBpgQrB.vVN/uGEsCH5vgurVE8wjIi', 'Mario', 'Aguila', 'TIR', 'male', 'teacher', NULL, 'oWko4h1Xg3cSukAaQxUhNKl5znUAMzTpN1NFGt6BYfqZC07obMBK7yNBmEG2', '2017-05-26 01:42:05', '2017-05-28 13:38:43'),
(46, 'bryan@unab.cl', '$2y$10$wwMsiAq5eRBe.xqOpzQGwON1tZEVMxrfVqKwoOJ4P.xrjeg3F.Zai', 'Bryan', 'Faundez', 'TIR', 'male', 'teacher', NULL, 'N7rahfc4RhAhxf5Qtgo6MwMfcALHi5z91yFhdZllGdlr93DSotRUSX2y9qPb', '2017-05-26 01:42:24', '2019-09-12 15:38:43'),
(47, 'jonathan.rojas.roco@gmail.com', '$2y$10$bdn6X3DQ9wiZFbkoz1cG4uiFBfe1fiPIO.ppzsoAdZ/CerQKWpg.q', 'Jonathan', 'Rojas', 'Roco', 'male', 'student', NULL, NULL, '2017-07-03 22:17:25', '2017-07-03 22:17:25'),
(48, 'sudchilena@hotmail.com', '$2y$10$M0MiImZ.Y2UYMSae/4jqW.HsGbujk.3E5O5JQA/1aQjcZsEG48meO', 'Priscila', 'Mella', 'Cifuentes', 'male', 'student', NULL, 'gU058S3zQiBW4JoMxHPTG8M3OzrxzUUA2GN57OSUR6pQlxtZRSi0BrTqNEms', '2017-07-06 17:43:04', '2017-07-06 19:17:47'),
(49, 'sudchilena1@gmail.com', '$2y$10$sod0qgfNDjlLiv6Fu0YmPO19mhgySViYd.yJX7Au5qMMAv3uCGkRC', 'Profesora Priscila', 'Mella', 'Cifuentes', 'male', 'teacher', NULL, 'YQP7CV4mzP4ut6HvCCElcWFeKsXc7ltprpZbDJ8vokMVDprpCKWh9JD0EsgN', '2017-07-06 18:55:42', '2017-07-06 19:18:26'),
(50, 'maria.truyol@unab.cl', '$2y$10$8P.M33rugRkq1hyW3aEcsewlyZt4W3LuWtITJbxsNcuR/JX4s5b1W', 'Maria', 'Elena', 'Truyol', 'male', 'student', NULL, '50z6JuKN51A4Ool9jqn6uypdeuSgQHJpVehtDE5byZt9sVjRL35wOi2R4LOx', '2018-07-10 18:44:44', '2018-07-25 18:49:59'),
(51, 'luis.rojas@unab.cl', '$2y$10$PqgYdx7rjrtlASmegFcc5Onuj13fOcAOginas/f5//nKAfPrRrBQS', 'Luis', 'Rojas', '', 'male', 'student', NULL, NULL, '2018-07-10 18:45:30', '2018-07-10 18:45:30'),
(52, 'test@test.cl', '$2y$10$eIE3EUe22sZqfhDrq9dl7.jG1ogPfS5l5qUDOtIuiDm.ZdjQgTig6', 'probando', 'test', 'testing', 'male', 'student', NULL, NULL, '2018-07-30 06:44:15', '2018-07-30 06:44:15'),
(53, 'christianoavila@gmail.com', '$2y$10$ltnIt4OF3U1nKj6DwvCdcuTVaJKVMmzmhc1XsWrdADqPBDCiwHzki', 'Christiano', 'Avila', 'Martino', 'male', 'student', NULL, NULL, '2018-10-22 22:40:06', '2018-10-22 22:40:06'),
(54, 'daniela@flexlearn.cl', '$2y$10$uzY6WzRGTVi4GQocS46Z0.teRd3H1CBmDy1Cnvj7pPPTXaYtS1v6K', 'Daniela', 'Hernandez', 'Low', 'male', 'teacher', NULL, NULL, '2018-12-19 23:28:43', '2018-12-19 23:28:43'),
(55, 'sara@flexlearn.cl', '$2y$10$y6ybX4e32.m9sxDnQ2YDwOFj3ElxF/y.j3v/JBGuhnmd7NfR9zPQy', 'Sara', 'Orellana', '', 'male', 'teacher', NULL, NULL, '2018-12-19 23:59:30', '2018-12-19 23:59:30'),
(56, 'macarena@flexlearn.cl', '$2y$10$sBC.D3KO12TxtetvlwMCg.jIlV5XuCRsrxU9LEZHBRnpd6Cv7WP26', 'Macarena', 'Rebolledo', '', 'male', 'teacher', NULL, NULL, '2018-12-20 00:01:11', '2018-12-20 00:01:11'),
(57, 'juanfelipe@flexlearn.cl', '$2y$10$tSBQhJSjejRh.lywddmeAeK6dRJb1vOiFMILJn0pfUssVQZ8F1aCC', 'Juan Felipe', 'Calderon', '', 'male', 'teacher', NULL, 'gb7pAymkqpgzAqVB45hqOM9uNUVHkuLkGXrTeBhfCsPjbaD82cETHlwYaBCs', '2018-12-20 00:03:07', '2018-12-20 17:34:12'),
(58, 'profesor01@std.cl', '$2y$10$FUaW/G4zRArwXTH97yCi.eKZUrgS5ASu2BuLXVR/S4HAGEkAfNGIO', 'Lilian', 'Ponce', '', 'male', 'student', NULL, 'YmKR6vQ646nTN9sBr2pchnBmIOoe5O2n5XgKe3LWUrPNwHbpOnohXmgksLnU', '2018-12-20 00:05:45', '2018-12-20 00:05:51'),
(59, 'profesor02@std.cl', '$2y$10$myBal7m/b8tCCaRuPETkpudr1qOqICAp7NoplWfrfGWEJnh7i96KC', 'Madai', 'Trabol', '', 'male', 'student', NULL, 'tw6aC5eSQF4y1RUV2uDwSBowQRS1rDOJJiJxsCqUCmAJas5Fe1Agtlff83tL', '2018-12-20 00:06:27', '2018-12-20 18:55:54'),
(60, 'profesor03@std.cl', '$2y$10$3pYE7uvP6zSHXi7b9kYVtu0ziMnfCjWlqmgJIueyHkBjXY4XUcqYC', 'Christian', 'Rojas', '', 'male', 'student', NULL, 'btAvNmnAFEAenj3dWuAUJ7d1G96c8Sq5M14aS5kcoEcyHGkQBxT4cdHfZcFh', '2018-12-20 00:07:00', '2018-12-20 00:07:03'),
(61, 'profesor04@std.cl', '$2y$10$9Drfa4f3gQLJwcMIVKjstuBlA5MDKQa6EMZDELcFRkQhD.cRIAxcq', 'Narciso', 'Veron', '', 'male', 'student', NULL, 'SXgKGS9v5qX8scrkyYczhmvwbO96OnCSSZIj7AHxOL8o7FEeHPBrZwaDsUpr', '2018-12-20 00:07:30', '2018-12-20 00:07:33'),
(62, 'profesor05@std.cl', '$2y$10$mRBjLg.l0OxKKkyI4Y1NIO53usrWVfdmv39vL6HEz4AsM/.4jFfcW', 'Alejandra', 'Sanchez', '', 'male', 'student', NULL, 'LBbT9VqAnNmxJMWPvy2Z8mqxo6pp1fXYBPQfoDV8Dv10XxGaxmuUFaSh4wao', '2018-12-20 00:08:13', '2018-12-20 18:27:27'),
(63, 'profesor06@std.cl', '$2y$10$UUESFzF16Qzmc2/UvhF2le6BePqXqu6QuaNhXErY0/B3JpqvT136e', 'Eliana', 'Andrade', '', 'male', 'student', NULL, 'ZpQYyWpsi952CC1KwA0xx46qVQKZCABPBhpEfRsu0yMlAjrNWfgpCexPILSH', '2018-12-20 00:09:06', '2018-12-20 00:09:09'),
(64, 'profesor07@std.cl', '$2y$10$8AFsvzKjST2zqmdiRme0mujK/NGoum7dc8QF4UzfyI6osbv6Gmy7u', 'Diane', 'Wlak', '', 'male', 'student', NULL, 'gAAEp6rl81EBB5n3PLJ83IRUNvA59CT0JHEk3vG72xTt8y6fQhBgSU4H7kcd', '2018-12-20 00:09:47', '2018-12-20 00:09:51'),
(65, 'profesor08@std.cl', '$2y$10$z363U6OxaE61uLft.Fqk4OIgZvJ4T3MxG4MBTEjWXwp4lbl5MELsq', 'Ivonne', 'Chavez', '', 'male', 'student', NULL, 'TpKv05lrpuWr3Sz63dAwZHz6Wvzl7V5XtqmX39z8m5SI6RaRpk1GfJ1rDWOU', '2018-12-20 00:10:31', '2018-12-20 00:10:34'),
(66, 'profesor09@std.cl', '$2y$10$.AJQNE3ZY4i8m3Ua56TBwuUpDxciABozHkZAxh8MwELVN1u7ySI62', 'CarmenGloria', 'Munoz', '', 'male', 'student', NULL, 'O8h12RcHVJzStnWzei7pwKLmY5TyppCwSpI5GNib1hEYUfZgLjXL13QfYXoM', '2018-12-20 00:11:53', '2018-12-20 00:11:57'),
(67, 'profesor10@std.cl', '$2y$10$.//p0hvjXpYYHMf727EeT.c6JjhIlb.jK2IT9Ac/9BiVpQ7U0OYOy', 'Valeska', 'Gallardo', '', 'male', 'student', NULL, '5kKetk45ZFcVyeuf6vcB9Bze974WRr19EfGELtpKtoCC9rjD4IGTTysDlZn8', '2018-12-20 00:12:27', '2018-12-20 18:54:37'),
(68, 'profesor11@std.cl', '$2y$10$H6hoyz8K4lEL/vnHvLuQCuN8l.qCT.zmSSyTKBpJ8oKJf6Htk8vwu', 'Kristel', 'Waghorn', '', 'male', 'student', NULL, 'MaofPc4czs8Y8xWnY1PT6D3LYckFwmTpS71y3wzw8P5OPJHI7XzVFsucuC50', '2018-12-20 00:13:13', '2018-12-20 00:13:16'),
(69, 'profesor12@std.cl', '$2y$10$nNrLYk9EMpsy7brucu/KzehJJdYpKfZrsNu5vH3octwRRNYlvwqBG', 'Monica', 'Guzman', '', 'male', 'student', NULL, 'wpSic0hs00XbgOxu6eEGOefaa9mZz5FUdrAF2amDNvntSfqNtSqeV6tJIh3U', '2018-12-20 17:01:39', '2018-12-20 17:01:45'),
(70, 'jf@flexlearn.cl', '$2y$10$hBEE0P2855vO44PvtyU3vOoyHWbj8fn2pvEgrWBj76Wl1EOKUijK.', 'JF', 'Alumno', '', 'male', 'student', NULL, 'tcRxoit6hsc6oqI1Yg80FBuXQQgxCS9xzVWmNCM9oUkoGyhuFP6E4IZOkM0f', '2018-12-20 17:33:47', '2018-12-20 18:48:34'),
(71, 'pablodanielsantur@gmail.com', '$2y$10$OVMRvyN.PgYM/RajGXo7FOfiw61WFY87P6KCr5v4K5cpEze2hehIe', 'Pablo', 'Santur', 'Arreluce', 'male', 'student', NULL, NULL, '2019-03-14 10:15:58', '2019-03-14 10:15:58'),
(72, 'mauriciozx1@gmail.com', '$2y$10$tleZ60UlO0ccOJchc6w9Veksm4duUH.sDUcOY/NAitedknNIiiX.W', 'Mauricio', 'Cisternas', 'Curaqueo', 'male', 'student', NULL, NULL, '2020-08-28 07:05:48', '2020-08-28 07:05:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `activities_groups`
--
ALTER TABLE `activities_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problem_id` (`problem_id`) USING BTREE;

--
-- Indices de la tabla `blockly_activity_answers`
--
ALTER TABLE `blockly_activity_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_id` (`activity_id`,`student_id`) USING BTREE;

--
-- Indices de la tabla `califications`
--
ALTER TABLE `califications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`answere_id`,`activity_id`) USING BTREE,
  ADD KEY `activity_id` (`activity_id`) USING BTREE,
  ADD KEY `student_id_2` (`student_id`) USING BTREE;

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `course_inscriptions`
--
ALTER TABLE `course_inscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`,`user_id`) USING BTREE,
  ADD KEY `student_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `group_activity_link`
--
ALTER TABLE `group_activity_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`activity_id`) USING BTREE,
  ADD KEY `activity_id` (`activity_id`) USING BTREE;

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE,
  ADD KEY `password_resets_token_index` (`token`) USING BTREE;

--
-- Indices de la tabla `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`) USING BTREE;

--
-- Indices de la tabla `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`) USING BTREE;

--
-- Indices de la tabla `problem_activity_groups`
--
ALTER TABLE `problem_activity_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problem_id` (`problem_id`,`group_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `teamwork_id` (`teamwork_id`);

--
-- Indices de la tabla `researchers`
--
ALTER TABLE `researchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`answere_id`,`activity_id`) USING BTREE,
  ADD KEY `activity_id` (`activity_id`) USING BTREE,
  ADD KEY `student_id_2` (`student_id`) USING BTREE;

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `teamwork`
--
ALTER TABLE `teamwork`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teamwork_inscription`
--
ALTER TABLE `teamwork_inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problems_id` (`problems_id`),
  ADD KEY `teamwork_id` (`teamwork_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `activities_groups`
--
ALTER TABLE `activities_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT de la tabla `blockly_activity_answers`
--
ALTER TABLE `blockly_activity_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `califications`
--
ALTER TABLE `califications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `course_inscriptions`
--
ALTER TABLE `course_inscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `group_activity_link`
--
ALTER TABLE `group_activity_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `problem`
--
ALTER TABLE `problem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `problems`
--
ALTER TABLE `problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `problem_activity_groups`
--
ALTER TABLE `problem_activity_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `researchers`
--
ALTER TABLE `researchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `teamwork`
--
ALTER TABLE `teamwork`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `califications`
--
ALTER TABLE `califications`
  ADD CONSTRAINT `califications_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `califications_ibfk_2` FOREIGN KEY (`answere_id`) REFERENCES `blockly_activity_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `course_inscriptions`
--
ALTER TABLE `course_inscriptions`
  ADD CONSTRAINT `course_inscriptions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_inscriptions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `group_activity_link`
--
ALTER TABLE `group_activity_link`
  ADD CONSTRAINT `group_activity_link_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_activity_link_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `activities_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `problem_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `problems`
--
ALTER TABLE `problems`
  ADD CONSTRAINT `problems_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `problem_activity_groups`
--
ALTER TABLE `problem_activity_groups`
  ADD CONSTRAINT `problem_activity_groups_ibfk_1` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `problem_activity_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `activities_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `problem_activity_groups_ibfk_3` FOREIGN KEY (`teamwork_id`) REFERENCES `teamwork` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `researchers`
--
ALTER TABLE `researchers`
  ADD CONSTRAINT `researchers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`answere_id`) REFERENCES `blockly_activity_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `teamwork_inscription`
--
ALTER TABLE `teamwork_inscription`
  ADD CONSTRAINT `teamwork_inscription_ibfk_1` FOREIGN KEY (`problems_id`) REFERENCES `problems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teamwork_inscription_ibfk_2` FOREIGN KEY (`teamwork_id`) REFERENCES `teamwork` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
