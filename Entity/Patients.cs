//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Poliklinika.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patients
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Patients()
        {
            this.HistoryOfDisease = new HashSet<HistoryOfDisease>();
        }
    
        public int id { get; set; }
        public string Surname { get; set; }
        public string Firstname { get; set; }
        public string Patronymic { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public int Age { get; set; }
        public int Gender { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HistoryOfDisease> HistoryOfDisease { get; set; }
        public string FullName
        {
            get
            {
                string go = string.Empty;
                go = Surname + " " + Firstname + " " + Patronymic;
                return go;
            }
        }
        public string FullGender
        {
            get
            {
                string go = string.Empty;
                if(Gender == 1)
                {
                    go = "Мужской";
                } else
                {
                    go = "Женский";
                }
                return go;
            }
        }
    }
}
