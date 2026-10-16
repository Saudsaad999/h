<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>الحوكمة - نظام إدارة الشواهد والمستندات</title>
    <style>
        :root {
            --primary-color: #0f5132;
            --secondary-color: #198754;
            --bg-color: #f4f6f8;
            --card-bg: #ffffff;
            --text-color: #212529;
            --border-color: #dee2e6;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        /* شريط التنقل العلوي */
        .navbar {
            position: sticky;
            top: 0;
            background-color: var(--primary-color);
            color: white;
            padding: 10px 20px;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
        }

        .nav-brand {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-logo {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            object-fit: cover;
            background: white;
            padding: 2px;
        }

        .navbar-title {
            margin: 0;
            font-size: 1.1rem;
            font-weight: bold;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 300px;
        }

        .nav-menu {
            display: flex;
            gap: 6px;
            overflow-x: auto;
            padding: 5px 0;
            max-width: 100%;
        }

        .nav-item {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            text-decoration: none;
            font-size: 0.8rem;
            white-space: nowrap;
            transition: background 0.2s, transform 0.2s;
        }

        .nav-item:hover, .nav-item.active {
            background: rgba(255, 255, 255, 0.35);
            transform: scale(1.05);
        }

        .container {
            max-width: 1100px;
            margin: 20px auto;
            padding: 0 15px;
        }

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            background: var(--card-bg);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            flex-wrap: wrap;
            gap: 15px;
        }

        .main-header-content {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .header-logo {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            border: 1px solid var(--border-color);
            background: white;
        }

        .export-btn {
            background-color: #198754;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .export-btn:hover {
            background-color: #146c43;
        }

        .domain-card {
            background: var(--card-bg);
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            border: 1px solid var(--border-color);
            overflow: hidden;
            scroll-margin-top: 80px;
        }

        .domain-header {
            background-color: #e8f5e9;
            color: var(--primary-color);
            padding: 15px 20px;
            font-size: 1.25rem;
            font-weight: bold;
            border-bottom: 2px solid #a3cfbb;
        }

        .evidence-list {
            padding: 10px 20px;
        }

        .evidence-item {
            display: flex;
            flex-direction: column;
            gap: 12px;
            padding: 16px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .evidence-item:last-child {
            border-bottom: none;
        }

        .evidence-title {
            font-weight: 600;
            font-size: 0.95rem;
            line-height: 1.5;
            color: #333;
        }

        .file-upload-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .file-input {
            display: none;
        }

        .file-label {
            background-color: var(--primary-color);
            color: white;
            padding: 7px 14px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.85rem;
            transition: background 0.2s;
        }

        .file-label:hover {
            background-color: #0b3d26;
        }

        .preview-btn {
            background-color: #0dcaf0;
            color: #212529;
            border: none;
            padding: 7px 14px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.85rem;
            font-weight: 600;
            display: none;
            text-decoration: none;
        }

        .preview-btn:hover {
            background-color: #31d2f2;
        }

        .file-status {
            font-size: 0.85rem;
            color: #6c757d;
            word-break: break-all;
        }

        .status-uploaded {
            color: #198754;
            font-weight: bold;
        }

        @media (min-width: 768px) {
            .evidence-item {
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }
            .file-upload-wrapper {
                margin-top: 0;
            }
            .evidence-title {
                max-width: 60%;
            }
        }
    </style>
</head>
<body>

<!-- شريط التنقل العلوي -->
<div class="navbar">
    <div class="nav-brand">
        <img src="logo.jpeg" alt="Logo" class="nav-logo" onerror="this.style.display='none'">
        <h2 class="navbar-title" id="current-nav-title">الحوكمة - الامتثال والالتزام</h2>
    </div>
    <div class="nav-menu" id="nav-menu"></div>
</div>

<div class="container">
    <div class="header-actions">
        <div class="main-header-content">
            <img src="logo.jpeg" alt="شعار الجمعية" class="header-logo" onerror="this.src='https://via.placeholder.com/60?text=Ghadaq'">
            <div>
                <h1 style="margin:0; color: var(--primary-color); font-size: 1.8rem;">معيار الامتثال والالتزام</h1>
                <p style="margin:5px 0 0 0; color:#6c757d;">إدارة الشواهد، إرفاق المستندات، المعاينة الفورية، وتصدير تقرير الإكسل</p>
            </div>
        </div>
        <button class="export-btn" onclick="exportToExcel()">
            📊 تنزيل ملف Excel
        </button>
    </div>

    <!-- مجالات الحوكمة والشواهد -->
    <div id="domains-container"></div>
</div>

<script>
const domainsData = [
    {
        id: "m1",
        title: "1. اللائحة الأساسية للجمعية",
        items: [
            "اللائحة الأساسية",
            "إجراءات تعديل اللائحة الأساسية (اجتماع الجمعية العمومية بالموافقة على التعديل + خطاب الرفع للمركز)"
        ]
    },
    {
        id: "m2",
        title: "2. الجمعية العمومية",
        items: [
            "سجل أعضاء الجمعية العمومية محدث (مع ضرورة وجود زيادة في الأعضاء خلال سنة 2025م)",
            "سجل اجتماعات الجمعية العمومية محدث",
            "محضر اجتماع الجمعية العمومية العادية 2026م (القوائم المالية 2025، التقرير السنوي 2025، الموازنة التقديرية 2026، الخطة التشغيلية 2026)",
            "إثبات رفع محضر الجمعية العمومية للمركز الوطني",
            "محضر اجتماع الجمعية العمومية غير العادية 2025م إن وجد (مع نسخة الدعوات وخطاب الرفع للمركز)",
            "القوائم المالية لسنة 2026م المعتمدة من الجمعية العمومية",
            "التقرير السنوي للبرامج والأنشطة لسنة 2025م المعتمد من الجمعية العمومية",
            "الموازنة التقديرية لسنة 2026م المعتمدة من الجمعية العمومية",
            "الخطة التشغيلية لسنة 2026م المعتمدة من الجمعية العمومية",
            "إبراء الذمة في حال وجود تغيير في مجلس الإدارة"
        ]
    },
    {
        id: "m3",
        title: "3. مجلس الإدارة",
        items: [
            "تقرير البرنامج التعريفي لمجلس الإدارة لعام 2025 أو 2026",
            "ملف المسؤول التنفيذي (قرار التعيين وإبلاغ المركز)",
            "ملف المدير المالي (قرار التعيين والمهام المكلف بها)",
            "سياسة تعارض المصالح ومحضر اعتماد السياسة من المجلس",
            "سياسة الإبلاغ عن المخالفات ومحضر اعتماد السياسة من المجلس",
            "سياسة تنظيم العلاقة مع المستفيدين ومحضر اعتماد السياسة من المجلس",
            "مصفوفة صلاحيات المجلس والصلاحيات الممنوحة من قبل المجلس",
            "سياسة المكافآت والامتيازات ومحضر اعتماد السياسة من الجمعية العمومية",
            "سياسة خصوصية البيانات ومحضر اعتماد السياسة من المجلس",
            "سياسة الاحتفاظ بالوثائق وإتلافها ومحضر اعتماد السياسة من المجلس",
            "سياسة جمع التبرعات ومحضر اعتماد السياسة من المجلس",
            "آلية إدارة المتطوعين المحدثة ومحضر اعتماد السياسة من المجلس",
            "لائحة الموارد البشرية المحدثة ومحضر اعتماد السياسة من المجلس",
            "إجراءات انتهاء دورة المجلس (دعوة الترشح، خطاب الإقفال، عرض الأسماء، الرفع للمركز)",
            "قرار تعيين المراجع الداخلي",
            "نظام الرقابة الداخلي ومحضر الاعتماد من المجلس",
            "تقرير متابعة تنفيذ قرارات الجمعية العمومية",
            "نماذج الإفصاح عن تعارض المصالح أعضاء المجلس والموظفين",
            "تقارير متابعة تنفيذ قرارات مجلس الإدارة",
            "محاضر اجتماعات مجلس الإدارة 2025م (لا تقل عن 4 اجتماعات)",
            "بيان محدث بمناصب أعضاء المجلس ووظائفهم خارج الجمعية والموافقات اللازمة"
        ]
    },
    {
        id: "m4",
        title: "4. الفروع والمكاتب",
        items: [
            "بيان بالمكاتب والفروع للجمعية (إن وجدت)",
            "موافقة المركز على إنشاء الفروع والمكاتب (إن وجدت)"
        ]
    },
    {
        id: "m5",
        title: "5. التقارير",
        items: [
            "عقد مراجع الحسابات الخارجي مع ترخيص المكتب",
            "القوائم المالية لعام 2025م المعتمدة من الجمعية العمومية مع خطاب الرفع للمركز",
            "التقرير السنوي للبرامج والأنشطة لعام 2025م المعتمد من الجمعية العمومية"
        ]
    },
    {
        id: "m6",
        title: "6. الأنظمة السرية والالتزام",
        items: [
            "تقييم المخاطر التأصلية والكاملة مع محضر مجلس الإدارة الذي نوقشت فيه",
            "دليل الإجراءات في حال وجود شبهة غسل أموال أو تمويل إرهاب",
            "تقرير البرنامج التوعوي عن غسل الأموال وتمويل الإرهاب"
        ]
    },
    {
        id: "m7",
        title: "7. الأنشطة والفعاليات",
        items: [
            "شهادة تسجيل الجمعية",
            "التقرير السنوي عن البرامج والأنشطة",
            "موافقة الجهة المشرفة فنياً على تنفيذ البرامج والأنشطة",
            "قائمة البرامج وموافقة المركز لإقامتها خارج النطاق الإداري (إن وجدت)",
            "قائمة وموافقة المركز للأنشطة والخدمات المقدمة خارج المملكة (إن وجدت)"
        ]
    },
    {
        id: "m8",
        title: "8. الإيرادات والمصروفات والتملك",
        items: [
            "ترخيص جمع التبرعات وحسابات وتقارير التبرعات",
            "قائمة العقارات والاستثمارات وموافقة الجمعية العمومية على التملك (إن وجدت)"
        ]
    },
    {
        id: "m9",
        title: "9. الوثائق والسجلات",
        items: [
            "سجل المستفيدين وصورة من كيفية حفظه",
            "نسخة من بطاقات العضوية لأعضاء الجمعية العمومية وتقرير استلامهم"
        ]
    },
    {
        id: "m10",
        title: "10. تكوين اللجان",
        items: [
            "قائمة باللجان المكونة وقرارات التكوين واختصاصاتها ومحاضر اجتماعاتها",
            "قرار تشكيل لجنة المراجعة الداخلية",
            "قرار تشكيل لجنة الترشيحات والمكافآت"
        ]
    }
];

const fileRecords = {};

function initApp() {
    const navContainer = document.getElementById('nav-menu');
    const mainContainer = document.getElementById('domains-container');

    domainsData.forEach((domain, dIdx) => {
        const navLink = document.createElement('a');
        navLink.className = 'nav-item';
        navLink.href = `#${domain.id}`;
        navLink.innerText = domain.title.split('.')[1] || domain.title;
        navLink.setAttribute('data-target', domain.id);
        navContainer.appendChild(navLink);

        const card = document.createElement('div');
        card.className = 'domain-card';
        card.id = domain.id;

        const header = document.createElement('div');
        header.className = 'domain-header';
        header.innerText = domain.title;
        card.appendChild(header);

        const list = document.createElement('div');
        list.className = 'evidence-list';

        domain.items.forEach((itemText, iIdx) => {
            const key = `${dIdx}-${iIdx}`;
            
            const itemDiv = document.createElement('div');
            itemDiv.className = 'evidence-item';

            const title = document.createElement('div');
            title.className = 'evidence-title';
            title.innerText = itemText;

            const uploadWrapper = document.createElement('div');
            uploadWrapper.className = 'file-upload-wrapper';

            const inputId = `file-${key}`;
            
            const input = document.createElement('input');
            input.type = 'file';
            input.id = inputId;
            input.className = 'file-input';

            const label = document.createElement('label');
            label.htmlFor = inputId;
            label.className = 'file-label';
            label.innerText = '📁 رفع المستند';

            const previewBtn = document.createElement('a');
            previewBtn.className = 'preview-btn';
            previewBtn.target = '_blank';
            previewBtn.innerText = '👁️ معاينة الشاهد';

            const statusSpan = document.createElement('span');
            statusSpan.className = 'file-status';
            statusSpan.innerText = 'لم يتم الإرفاق';

            input.addEventListener('change', function(e) {
                const file = e.target.files[0];
                if (file) {
                    const ext = file.name.substring(file.name.lastIndexOf('.'));
                    const formattedName = itemText.replace(/[/\\?%*:|"<>]/g, '-') + ext;
                    
                    fileRecords[key] = {
                        domainTitle: domain.title,
                        itemText: itemText,
                        fileName: formattedName,
                        isUploaded: true
                    };

                    statusSpan.innerText = `تم الرفع: ${formattedName}`;
                    statusSpan.className = 'file-status status-uploaded';

                    const fileURL = URL.createObjectURL(file);
                    previewBtn.href = fileURL;
                    previewBtn.style.display = 'inline-block';
                }
            });

            uploadWrapper.appendChild(label);
            uploadWrapper.appendChild(previewBtn);
            uploadWrapper.appendChild(input);
            uploadWrapper.appendChild(statusSpan);

            itemDiv.appendChild(title);
            itemDiv.appendChild(uploadWrapper);

            list.appendChild(itemDiv);
        });

        card.appendChild(list);
        mainContainer.appendChild(card);
    });

    setupScrollSpy();
}

function setupScrollSpy() {
    const observerOptions = {
        root: null,
        rootMargin: '-20% 0px -60% 0px',
        threshold: 0
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const domainId = entry.target.id;
                const activeDomain = domainsData.find(d => d.id === domainId);
                
                if (activeDomain) {
                    document.getElementById('current-nav-title').innerText = activeDomain.title;
                }

                document.querySelectorAll('.nav-item').forEach(nav => {
                    if (nav.getAttribute('data-target') === domainId) {
                        nav.classList.add('active');
                    } else {
                        nav.classList.remove('active');
                    }
                });
            }
        });
    }, observerOptions);

    domainsData.forEach(domain => {
        const el = document.getElementById(domain.id);
        if (el) observer.observe(el);
    });
}

function exportToExcel() {
    let csvContent = "\uFEFF"; 
    csvContent += "المجال,اسم الشاهد / السؤال,حالة المستند,اسم الملف المرفق\n";

    domainsData.forEach((domain, dIdx) => {
        domain.items.forEach((itemText, iIdx) => {
            const key = `${dIdx}-${iIdx}`;
            const record = fileRecords[key];

            const colDomain = `"${domain.title.replace(/"/g, '""')}"`;
            const colItem = `"${itemText.replace(/"/g, '""')}"`;
            const colStatus = record && record.isUploaded ? `"مرفوع"` : `"غير مرفوع"`;
            const colFile = record && record.isUploaded ? `"${record.fileName.replace(/"/g, '""')}"` : `"-"`;

            csvContent += `${colDomain},${colItem},${colStatus},${colFile}\n`;
        });
    });

    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.setAttribute("href", url);
    link.setAttribute("download", "تقرير_شواهد_الحوكمة.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

document.addEventListener('DOMContentLoaded', initApp);
</script>

</body>
</html>
