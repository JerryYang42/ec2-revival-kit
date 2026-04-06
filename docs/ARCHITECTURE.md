# Architecture

## Overview
TODO: describe what this server does in 2–3 sentences.

## Instance details
| Property       | Value              |
|----------------|--------------------|
| Provider       | AWS EC2            |
| Instance type  | t2.micro (free tier) |
| Region         | eu-west-1          |
| OS             | Ubuntu 24.04 LTS   |

## Services running
| Service  | Port | Description             |
|----------|------|-------------------------|
| nginx    | 80   | Reverse proxy           |
| app      | 3000 | Application server      |

## External dependencies
TODO: list any external services (databases, APIs, S3 buckets, etc.)

## Network
TODO: describe security groups, open ports, VPC setup.
