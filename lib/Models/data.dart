import 'package:project_ebook/Models/book_model.dart';

var categoryData = [
  {
    "icon": "Assets/Icons/heart.svg",
    "label": "Scince",
  },
  {
    "icon": "Assets/Icons/plane.svg",
    "label": "Commerce",
  },
  {
    "icon": "Assets/Icons/world.svg",
    "label": "Literature",
  },
  {
    "icon": "Assets/Icons/heart.svg",
    "label": "Humanities",
  },
];

var bookData = [
  BookModel(
    id: "1",
    title: "Boundaries",
    description:
        "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
    aboutAuthor: "hi my name is Nitish Roy and i have written this book",
    audioLen: "20",
    author: "Nitish Roy",
    coverUrl: "Assets/Images/boundraries.jpg",
    rating: "4.2",
    category: "Documentary",
    numberofRating: "10",
    price: 100,
    pages: 234,
    language: "ENG",
  ),
  BookModel(
    id: "2",
    title: "Daily Stoic",
    description:
        "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
    aboutAuthor: "hi my name is Nitish Roy and i have written this book",
    audioLen: "20",
    author: "Nitish Roy",
    coverUrl: "Assets/Images/daily stoic.jpg",
    rating: "4.2",
    category: "Documentary",
    price: 100,
    numberofRating: "10,",
    language: "ENG",
    pages: 234,
  ),
  BookModel(
    id: "3",
    title: "Give and Take",
    description:
        "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
    aboutAuthor: "hi my name is Nitish Roy and i have written this book",
    audioLen: "20",
    author: "Nitish Roy",
    coverUrl: "Assets/Images/Give and Take.jpg",
    rating: "4.2",
    category: "Documentary",
    numberofRating: "10,",
    price: 100,
    language: "ENG",
    pages: 234,
  ),
  BookModel(
    id: "4",
    title: "When the moon split",
    description:
        "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
    aboutAuthor: "hi my name is Nitish Roy and i have written this book",
    audioLen: "20",
    author: "Nitish Roy",
    coverUrl: "Assets/Images/When the moon split.jpg",
    rating: "4.2",
    category: "Documentary",
    price: 100,
    pages: 234,
    language: "ENG",
    numberofRating: "10,",
  )
];
