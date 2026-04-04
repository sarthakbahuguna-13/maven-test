<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*, java.util.Date" %>
<%
    String serverHostName = "Unavailable";
    String serverIP = "Unavailable";

    try {
        InetAddress inetAddress = InetAddress.getLocalHost();
        serverHostName = inetAddress.getHostName();
        serverIP = inetAddress.getHostAddress();
    } catch (Exception e) {
        serverHostName = "Error fetching hostname";
        serverIP = "Error fetching IP";
    }

    String clientIP = request.getRemoteAddr();
    String clientHost = request.getRemoteHost();
    String currentTime = new Date().toString();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sarthak Bahuguna | DevOps Portfolio</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background:
                radial-gradient(circle at top left, rgba(59,130,246,0.18), transparent 35%),
                radial-gradient(circle at bottom right, rgba(16,185,129,0.15), transparent 30%),
                linear-gradient(135deg, #0b1120, #111827, #1f2937);
            color: #f8fafc;
            min-height: 100vh;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1240px;
            margin: 0 auto;
            padding: 30px 0 50px;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 24px;
            margin-bottom: 28px;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.10);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.20);
        }

        .brand {
            font-size: 1.3rem;
            font-weight: 700;
            color: #38bdf8;
            letter-spacing: 0.5px;
        }

        .nav-right {
            color: #cbd5e1;
            font-size: 0.95rem;
        }

        .hero {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 24px;
            align-items: stretch;
            margin-bottom: 28px;
        }

        .hero-left, .hero-right, .card, .project-card, .contact-card {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.10);
            border-radius: 24px;
            backdrop-filter: blur(14px);
            box-shadow: 0 12px 35px rgba(0,0,0,0.22);
        }

        .hero-left {
            padding: 42px;
        }

        .hero-right {
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .tag {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 999px;
            background: rgba(56,189,248,0.14);
            color: #7dd3fc;
            border: 1px solid rgba(56,189,248,0.25);
            font-size: 0.9rem;
            margin-bottom: 18px;
        }

        .hero h1 {
            font-size: 3.1rem;
            line-height: 1.1;
            margin-bottom: 12px;
            color: #ffffff;
        }

        .hero h1 span {
            color: #38bdf8;
        }

        .hero h2 {
            font-size: 1.25rem;
            color: #cbd5e1;
            font-weight: 400;
            margin-bottom: 18px;
        }

        .hero p {
            color: #94a3b8;
            font-size: 1.03rem;
            max-width: 780px;
            margin-bottom: 26px;
        }

        .button-group {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            margin-top: 8px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.25s ease;
        }

        .btn-primary {
            background: linear-gradient(90deg, #0ea5e9, #2563eb);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(37,99,235,0.30);
        }

        .btn-secondary {
            border: 1px solid rgba(255,255,255,0.14);
            color: #e2e8f0;
            background: rgba(255,255,255,0.04);
        }

        .btn-secondary:hover {
            background: rgba(255,255,255,0.08);
            transform: translateY(-2px);
        }

        .mini-title {
            font-size: 1.1rem;
            color: #38bdf8;
            margin-bottom: 16px;
            font-weight: 700;
        }

        .quick-info {
            display: grid;
            gap: 12px;
        }

        .quick-info div {
            padding: 14px 16px;
            border-radius: 14px;
            background: rgba(255,255,255,0.04);
            color: #e2e8f0;
            border: 1px solid rgba(255,255,255,0.06);
        }

        .quick-info span {
            color: #94a3b8;
            font-weight: 600;
            display: block;
            font-size: 0.9rem;
            margin-bottom: 4px;
        }

        .section {
            margin-top: 26px;
        }

        .section-title {
            font-size: 1.8rem;
            color: #ffffff;
            margin-bottom: 16px;
        }

        .section-subtitle {
            color: #94a3b8;
            margin-bottom: 22px;
        }

        .stack-grid, .info-grid, .project-grid, .contact-grid {
            display: grid;
            gap: 20px;
        }

        .stack-grid {
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        }

        .stack-badge {
            text-align: center;
            padding: 18px 12px;
            border-radius: 16px;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.08);
            font-weight: 600;
            color: #e2e8f0;
            transition: transform 0.25s ease;
        }

        .stack-badge:hover {
            transform: translateY(-5px);
        }

        .info-grid {
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        }

        .card {
            padding: 24px;
        }

        .card h3 {
            margin-bottom: 14px;
            color: #38bdf8;
            font-size: 1.2rem;
        }

        .card p {
            margin-bottom: 10px;
            color: #e2e8f0;
        }

        .label {
            color: #94a3b8;
            font-weight: 700;
        }

        .project-grid {
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        }

        .project-card {
            padding: 24px;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .project-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 35px rgba(0,0,0,0.28);
        }

        .project-card h4 {
            color: #ffffff;
            margin-bottom: 10px;
            font-size: 1.08rem;
        }

        .project-card p {
            color: #cbd5e1;
            font-size: 0.96rem;
        }

        .contact-grid {
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        }

        .contact-card {
            padding: 24px;
        }

        .contact-card h3 {
            color: #38bdf8;
            margin-bottom: 12px;
        }

        .contact-card p, .contact-card a {
            color: #e2e8f0;
            text-decoration: none;
        }

        .contact-card a:hover {
            color: #7dd3fc;
        }

        .footer {
            text-align: center;
            margin-top: 36px;
            padding: 20px;
            color: #94a3b8;
            border-top: 1px solid rgba(255,255,255,0.08);
        }

        @media (max-width: 900px) {
            .hero {
                grid-template-columns: 1fr;
            }

            .hero h1 {
                font-size: 2.4rem;
            }
        }

        @media (max-width: 560px) {
            .navbar {
                flex-direction: column;
                gap: 8px;
                text-align: center;
            }

            .hero-left,
            .hero-right,
            .card,
            .project-card,
            .contact-card {
                padding: 20px;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                text-align: center;
            }
        }
    </style>
</head>
<body>

    <div class="container">

        <div class="navbar">
            <div class="brand">Sarthak Bahuguna</div>
            <div class="nav-right">DevOps Portfolio Application</div>
        </div>

        <section class="hero">
            <div class="hero-left">
                <div class="tag">Live Deployment Demo</div>
                <h1>Hello, I'm <span>Sarthak Bahuguna</span></h1>
                <h2>DevOps Engineer | Cloud Enthusiast | CI/CD | Kubernetes | AWS</h2>
                <p>
                    This is my personal JSP-based portfolio application built to showcase hands-on experience in
                    application deployment, server visibility, containerization, and DevOps workflows.
                    I use projects like this to demonstrate practical understanding of
                    Jenkins pipelines, Docker image creation, Tomcat hosting, Kubernetes deployment, and cloud environments.
                </p>

                <div class="button-group">
                    <a href="mailto:bahuguna.sarthak13@gmail.com" class="btn btn-primary">Contact Me</a>
                    <a href="#projects" class="btn btn-secondary">View Projects</a>
                </div>
            </div>

            <div class="hero-right">
                <div class="mini-title">Quick Snapshot</div>
                <div class="quick-info">
                    <div>
                        <span>Location</span>
                        Meerut, Uttar Pradesh, India
                    </div>
                    <div>
                        <span>Primary Focus</span>
                        AWS, Jenkins, Docker, Kubernetes, Terraform, Linux, Ansible
                    </div>
                    <div>
                        <span>Application Type</span>
                        Java JSP Web Application on Apache Tomcat
                    </div>
                    <div>
                        <span>Purpose</span>
                        Personal DevOps deployment showcase for interviews and demos
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <h2 class="section-title">Tech Stack</h2>
            <p class="section-subtitle">Core tools and platforms I use in my hands-on DevOps learning and project implementations.</p>

            <div class="stack-grid">
                <div class="stack-badge">Linux</div>
                <div class="stack-badge">Git & GitHub</div>
                <div class="stack-badge">Jenkins</div>
                <div class="stack-badge">Docker</div>
                <div class="stack-badge">Kubernetes</div>
                <div class="stack-badge">Helm</div>
                <div class="stack-badge">AWS</div>
                <div class="stack-badge">Terraform</div>
                <div class="stack-badge">Ansible</div>
                <div class="stack-badge">Tomcat</div>
            </div>
        </section>

        <section class="section">
            <h2 class="section-title">Runtime Environment Details</h2>
            <p class="section-subtitle">Dynamic values rendered by JSP to verify deployment and runtime connectivity.</p>

            <div class="info-grid">
                <div class="card">
                    <h3>Server Information</h3>
                    <p><span class="label">Server Host Name:</span> <%= serverHostName %></p>
                    <p><span class="label">Server IP Address:</span> <%= serverIP %></p>
                    <p><span class="label">Application Server:</span> Apache Tomcat</p>
                    <p><span class="label">Deployment Mode:</span> Demo / Interview Showcase</p>
                </div>

                <div class="card">
                    <h3>Client Information</h3>
                    <p><span class="label">Client IP Address:</span> <%= clientIP %></p>
                    <p><span class="label">Client Host Name:</span> <%= clientHost %></p>
                    <p><span class="label">Request Status:</span> Connected Successfully</p>
                    <p><span class="label">Access Time:</span> <%= currentTime %></p>
                </div>

                <div class="card">
                    <h3>Project Highlights</h3>
                    <p><span class="label">Use Case:</span> Personal portfolio deployment app</p>
                    <p><span class="label">Demo Goal:</span> Showcase CI/CD and deployment readiness</p>
                    <p><span class="label">Scalability Path:</span> Dockerized -> Kubernetes -> Helm</p>
                    <p><span class="label">Interview Value:</span> Real runtime visibility and deployment proof</p>
                </div>
            </div>
        </section>

        <section class="section" id="projects">
            <h2 class="section-title">Featured DevOps Showcase Projects</h2>
            <p class="section-subtitle">Examples of how this application can be positioned during interviews and live demos.</p>

            <div class="project-grid">
                <div class="project-card">
                    <h4>CI/CD Pipeline Integration</h4>
                    <p>
                        Built to be deployed through Jenkins pipeline stages including source checkout,
                        build, artifact packaging, Docker image creation, and deployment.
                    </p>
                </div>

                <div class="project-card">
                    <h4>Dockerized Java Web Application</h4>
                    <p>
                        This JSP app can be packaged into a Docker image and run consistently across
                        development, test, and production-style environments.
                    </p>
                </div>

                <div class="project-card">
                    <h4>Kubernetes Deployment Ready</h4>
                    <p>
                        The app is suitable for deployment into Kubernetes using Deployment, Service,
                        Ingress, ConfigMaps, and Helm-based release management.
                    </p>
                </div>

                <div class="project-card">
                    <h4>AWS Hosting Demonstration</h4>
                    <p>
                        Can be hosted on EC2 or extended to EKS to demonstrate cloud deployment,
                        load balancing, and environment-specific rollout strategies.
                    </p>
                </div>
            </div>
        </section>

        <section class="section">
            <h2 class="section-title">Contact & Identity</h2>
            <p class="section-subtitle">Simple professional details you can show directly in your interview deployment demo.</p>

            <div class="contact-grid">
                <div class="contact-card">
                    <h3>Personal Details</h3>
                    <p><strong>Name:</strong> Sarthak Bahuguna</p>
                    <p><strong>Location:</strong> Uttarakhand, India</p>
                    <p><strong>Role:</strong> DevOps / Cloud Engineer</p>
                </div>

                <div class="contact-card">
                    <h3>Contact</h3>
                    <p><strong>Email:</strong> <a href="mailto:bahuguna.sarthak13@gmail.com">bahuguna.sarthak13@gmail.com</a></p>
                    <p><strong>Project Type:</strong> Interview Portfolio Application</p>
                    <p><strong>Status:</strong> Active Demo Build</p>
                </div>
            </div>
        </section>

        <div class="footer">
            <p>Built and deployed by <strong>Sarthak Bahuguna</strong></p>
            <p>© 2026 Personal DevOps Portfolio | JSP + Tomcat + Deployment Showcase</p>
        </div>

    </div>

</body>
</html>
