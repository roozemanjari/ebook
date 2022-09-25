import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// API endpoint
 String backendURL = dotenv.env['BACKEND_API_URL'] ?? "opps";
// Colors
const Color primaryColor = Color(0xff842222);
const Color secondaryColor = Color(0xffFCF9F0);

// Constant variables
const List<String> genres = [
  "FANTASY FICTION",
  "ROMANCE",
  "FINANCE",
  "KIDS",
  "FAIRY TALE",
  "ADVENTURE"
];

const String aboutUsText =
    "Rooze’s Bookstore is an Online E-Book Management System which maintains the information about the books present in the library, their authors, the members who read and download those books etc.Owing to the advancement of technology, organization of an Online E-Book Library becomes much simple. The Online E-Book Library Management has been designed to computerize and automate the operations performed over the information about the members, book downloads and returns and all other operations. This computerization of library helps in many instances of its maintenances. It reduces the workload of management as most of the manual work done is reduced.";

const String copyrightText = "copyright@";
